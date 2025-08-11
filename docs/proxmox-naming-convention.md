# Proxmox Naming Convention & Tagging

## Overview

This documentation defines the naming convention and tagging strategy for virtual machines (VMs) and LXC containers in our Proxmox environment.

## Naming Convention

### Basic Structure

```
[Type]-[Environment]-[Service/Purpose]-[Number]
```

### Type Prefixes

| Prefix | Description |
|--------|-------------|
| `vm-`  | Virtual Machine |
| `lxc-` | LXC Container |

### Environment Abbreviations

| Abbreviation | Description | Usage |
|--------------|-------------|-------|
| `prd`  | Production   | Production systems |
| `dev`  | Development  | Development environment |
| `tst`  | Test/Staging | Test and staging environment |
| `lab`  | Laboratory   | Experiments and lab environment |

### Service/Purpose Categories

| Abbreviation | Description | Examples |
|--------------|-------------|----------|
| `web`     | Web Server | Apache, Nginx, IIS |
| `db`      | Database | MySQL, PostgreSQL, MongoDB |
| `app`     | Application Server | Node.js, Java, .NET |
| `proxy`   | Proxy/Load Balancer | HAProxy, Nginx Proxy |
| `mon`     | Monitoring | Prometheus, Grafana, Zabbix |
| `backup`  | Backup System | Veeam, Bacula, rsync |
| `dc`      | Domain Controller | Active Directory |
| `file`    | File Server | Samba, NFS, FTP |
| `mail`    | Mail Server | Postfix, Exchange |
| `dns`     | DNS Server | BIND, Unbound |
| `vpn`     | VPN Server | OpenVPN, WireGuard |
| `sec`     | Security | Firewall, IDS/IPS |

### Numbering

- Start with `01` for better sorting
- Use two-digit numbers (01, 02, 03, ...)
- For more than 99 instances: three digits (001, 002, ...)

## Examples

```bash
# Virtual Machines
vm-prd-web-01         # Production Web Server #1
vm-prd-db-01          # Production Database #1
vm-dev-app-01         # Development Application Server #1
vm-tst-proxy-01       # Test Load Balancer #1
vm-lab-mon-01         # Lab Monitoring Server #1

# LXC Containers
lxc-prd-web-01        # Production Web Container #1
lxc-dev-db-02         # Development DB Container #2
lxc-prd-backup-01     # Production Backup Container #1
lxc-lab-dns-01        # Lab DNS Container #1
```

## Tagging System

### Environment Tags

| Tag | Description |
|-----|-------------|
| `production` | Production systems |
| `development` | Development environment |
| `testing` | Test/staging environment |
| `laboratory` | Lab/experiment environment |

### Service Tags

| Tag | Description |
|-----|-------------|
| `webserver` | Web services |
| `database` | Database services |
| `application` | Application servers |
| `infrastructure` | Infrastructure services |
| `monitoring` | Monitoring systems |
| `security` | Security systems |
| `backup` | Backup services |
| `network` | Network services |

### Technology Tags

| Tag | Description |
|-----|-------------|
| `linux` | Linux-based systems |
| `windows` | Windows-based systems |
| `docker` | Docker containers |
| `kubernetes` | Kubernetes workloads |
| `nginx` | Nginx web server |
| `apache` | Apache web server |
| `mysql` | MySQL database |
| `postgresql` | PostgreSQL database |
| `redis` | Redis cache/DB |
| `elasticsearch` | Elasticsearch |

### Project Tags

```bash
# Format: project-[projectname]
project-alpha
project-beta
project-website
customer-xyz
internal-tools
```

### Maintenance Tags

| Tag | Description |
|-----|-------------|
| `auto-backup` | Automatic backup enabled |
| `critical` | Critical systems |
| `maintenance-sunday` | Sunday maintenance window |
| `maintenance-night` | Night maintenance window |
| `no-auto-update` | No automatic updates |
| `high-availability` | High availability system |

## Extended Naming Options

### With Location/Node (Multi-Node Setup)

```bash
# Format: [Type]-[Environment]-[Service]-[Node]-[Number]
vm-prd-web-node1-01
vm-prd-web-node2-01
lxc-dev-db-node3-01
```

### With Project Prefix

```bash
# Format: [Project]-[Type]-[Environment]-[Service]-[Number]
webapp-vm-prd-web-01
crm-lxc-prd-db-01
shop-vm-tst-app-01
```

### With Tenant Separation

```bash
# Format: [Tenant]-[Type]-[Environment]-[Service]-[Number]
client1-vm-prd-web-01
client2-lxc-prd-db-01
internal-vm-prd-mon-01
```

## Implementation Guidelines

### Proxmox-specific Configuration

1. **Use Description Fields**
   ```
   Description: "Production Nginx web server for main website"
   Notes: "Maintenance every Sunday 02:00-04:00 AM"
   ```

2. **Resource Pools**
   - `Production`
   - `Development`
   - `Testing`
   - `Laboratory`
   - `Project-Alpha`
   - `Customer-XYZ`

3. **Backup Jobs Based on Tags**
   ```bash
   # Daily backup for critical systems
   Tag: critical, production
   
   # Weekly backup for development
   Tag: development
   ```

### Consistency Rules

1. **Always use lowercase** letters
2. **Hyphens** instead of underscores or spaces
3. **No special characters** except hyphens
4. **Consistent length** of abbreviations
5. **Unique designations** per environment

### Tag Combinations (Examples)

```bash
# Web Server in Production
Tags: production, webserver, nginx, critical, auto-backup

# Development Database
Tags: development, database, mysql, project-alpha

# Test Application Server
Tags: testing, application, docker, project-beta, maintenance-sunday
```

## Documentation Template

For each VM/Container, the following information should be documented:

```markdown
## [VM/Container Name]

- **Type**: VM/LXC
- **Environment**: Production/Development/Testing/Laboratory
- **Service**: [Service description]
- **Tags**: [List of tags]
- **Contact**: [Responsible person/team]
- **Maintenance Window**: [Maintenance times]
- **Dependencies**: [Other services/VMs]
- **Backup Strategy**: [Backup details]
- **Last Updated**: [Date]
```

## Maintenance and Updates

1. **Regular review** of naming convention (bi-annually)
2. **Keep documentation current** with changes
3. **Team training** on convention updates
4. **Automated compliance checks** (optional)

## Migration of Existing Systems

1. **Gradual migration** of existing VMs/containers
2. **Prioritize critical systems**
3. **Plan downtime windows** for renaming
4. **Update documentation before migration**

## Best Practices

### Naming Guidelines

- **Be descriptive** but concise
- **Avoid abbreviations** that are not in the standard list
- **Use consistent patterns** across all environments
- **Consider future scaling** when choosing numbers
- **Document exceptions** and reasoning

### Tagging Best Practices

- **Use multiple tags** for better categorization
- **Keep tag names** simple and intuitive
- **Regularly review** and clean up unused tags
- **Create tag hierarchies** for complex environments
- **Use tags for automation** (backups, monitoring, etc.)

### Common Pitfalls to Avoid

- **Don't use spaces** in names or tags
- **Avoid cryptic abbreviations** not documented here
- **Don't mix naming styles** within the same environment
- **Avoid duplicate names** across different environments
- **Don't forget to update** documentation

## Automation Integration

### Backup Automation

```bash
# Example backup job configuration
# Daily backup for production critical systems
tags: production,critical
schedule: daily 02:00

# Weekly backup for development systems
tags: development
schedule: weekly sunday 03:00
```

### Monitoring Integration

```bash
# Monitor all production web servers
filter: tags contains "production" AND tags contains "webserver"

# Alert on critical systems
filter: tags contains "critical"
```

### Firewall Rules

```bash
# Allow web traffic to web servers
source: any
destination: tag:webserver
ports: 80,443

# Database access only from application servers
source: tag:application
destination: tag:database
ports: 3306,5432
```

---

**Version**: 1.0  
**Created**: [Date]  
**Last Updated**: [Date]  
**Responsible**: [Team/Person]