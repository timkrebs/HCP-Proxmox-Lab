# Demo repo for the "HCP Boundary at home" talk at HashiTalks 2023

Hello! If you're reading this, most likely you just watched my talk "HCP Boundary at home" and are interested in trying it out for yourself. Thank you for your interest and I hope this is useful!

## A few things to note

* First and foremost, this isn't meant to be something that works out of the box with a simple `terraform apply`. I'll walk you through the nuances and feel free to reach out directly or via an issue on this repo if you need help, but just know that you're going to need to massage this code a little bit before it works for your setup.
* Part of the snowflake-iness of this repo stems from the fact that the networking part of this (i.e. your home router) will probably look different than mine, and that's something that's hard to troubleshoot or account for. (In fact, don't let any strangers from the internet talk you into modifying any router settings you don't understand yourself.) If you watched the talk you'll more or less understand the design and if you're comfortable with making changes to your router, you should know what settings to tweak.
* By definition, this isn't meant to be used for production, but as HCP Boundary matures, it will be more suitable for mission-critical environments. The configuration in this repo doesn't necessarily reflect the best practices for a production setup, so just keep that in mind if you run into this repo in the future. As of this writing (February 2023), HCP Boundary is still in beta.
* I won't be updating this repo after the end of HashiTalks 2023 other than just adding a link to the video once it's published to YouTube (except if there are blatant errors or issues to fix).

## Prerequisites

* Get a free HCP account at https://cloud.hashicorp.com/
* A client_id/client_secret credential pair for HCP. You can read [here](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/guides/auth) how to get them.
* A working Kubernetes cluster. It can be as simple as a one-node cluster. If you don't have a cluster running but want to experiment, you can quickly spin one up with [k3d](https://github.com/k3d-io/k3d).
* A router or home network that allows port-forwarding from external connections.

## How to set up

* Set the `HCP_CLIENT_ID` and `HCP_CLIENT_SECRET` environment variables to the corresponding values of the HCP credentials you fetched above. Alternatively, you can set them explicitly in the `provider` block in hcp.tf
* (Optional) Set your backend configuration in `remote_backend.tf`. If you don't want to use any remote state backend, it'll default to using a local fine, which should be more than enough for experimentation purposes.
* Fill out the required variables, either by setting a default on them in `variables.tf`, or by any of the other methods documented [here](https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables).
* Run `terraform init` to get your backend initialized and your providers installed.
* Notice that the entire `workers.tf` file is commented out. This is because we first have to create the `hcp_boundary_cluster` resource and copy something manually.
* Run `terraform apply` and accept the changes.
* Now run `terraform output module.hcp.cluster_url` to get the URL of your HCP boundary instance and log in there. You can also log in through your HCP console, and clicking on the `Open Admin UI` button.
* Log in and click on `Auth Methods` on the left.
* You should only see a `password` auth method. Copy its id.
* Uncomment the contents of `workers.tf`. Paste the value of the auth method you copied in the step above into the `auth_method_id` field of the `boundary` provider.
* (Optional) Fill in the Kubernetes provider details, or leave empty to use the defaults.
* Run `terraform init` again to get the newly-uncommented providers installed.
* Run `terraform apply` again.
* Done!

## Where do I go from here?

The domain model of Boundary is kind of complex and explaining it is outside of the scope of this repo (or the talk), but you can read more about it [here](https://developer.hashicorp.com/boundary/docs/concepts/domain-model). The setup above will get you going with a very basic skeleton of what a Boundary cluster looks like and some "fake" targets. You'll need to tune it to your specific situation. From this point, you can configure it via the CLI or the UI, but it would make sense to keep all the configuration in Terraform as well.

Some of the resources you may want to create or experiment with are:

* [`boundary_scope`](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope) for creating more projects below the `global` scope.
* [`boundary_user`](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/user) for creating individual users.
* [`boundary_role`](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role) for creating roles on which more granular permissions can be applied.
* [`boundary_group`](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/group) to group together collections of users.

Additionally, you'll want to edit the `targets_ssh` module in `workers/boundary.tf` and/or add instances of this module to create targets that point to the hosts/ports in your network that you want to connect to through Boundary. Moreover, you can refactor the `workers/modules/boundary-targets` module to tune it to your particular needs, or write your own set of [`boundary_host_static`](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_static), [`boundary_host_set_static`](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_set_static), [`boundary_target`](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/target) resources if that suits you better.

Lastly, once you get more comfortable with the advanced capabilities of Boundary, you can start configuring those features with Terraform, like using [`boundary_auth_method_oidc`](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/auth_method_oidc) for OIDC authentication, [`boundary_credential_store_static`](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/credential_store_static) for credential injection, etc.

## Disclaimer/warning

Setting this up requires changes to your router that if not done properly can leave your home network exposed or vulnerable. Don't make any changes to your router that you don't fully understand. I cannot be made liable for any loss or damage due to an improper network configuration not explicitly defined here. The material provided here is for educational purposes, use at your own risk.