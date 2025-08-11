# Proxmox Tagging Guide with Color Coding

## Overview

This document extends the Proxmox Naming Convention with a detailed tagging strategy including color coding for better visual distinction and organization.

## Color Scheme for Tag Categories

### Environment Tags 🌍

| Tag | Color | Hex | Description |
|-----|-------|-----|-------------|
| `production` | **Red** | `#dc2626` | Production systems - highest attention |
| `staging` | **Orange** | `#ea580c` | Staging/Pre-Production |
| `testing` | **Yellow** | `#ca8a04` | Test environment |
| `development` | **Green** | `#16a34a` | Development environment |
| `laboratory` | **Blue** | `#2563eb` | Lab and experiments |
| `sandbox` | **Purple** | `#9333ea` | Isolated test environment |

### Service Category Tags 🔧

| Tag | Color | Hex | Description |
|-----|-------|-----|-------------|
| `webserver` | **Cyan** | `#0891b2` | Web services (Apache, Nginx) |
| `database` | **Indigo** | `#4338ca` | Database services |
| `application` | **Teal** | `#0d9488` | Application servers |
| `infrastructure` | **Gray** | `#6b7280` | Basic infrastructure services |
| `monitoring` | **Violet** | `#7c3aed` | Monitoring systems |
| `security` | **Red-Orange** | `#dc2626` | Security systems |
| `backup` | **Brown** | `#a3a3a3` | Backup services |
| `network` | **Dark Blue** | `#1e40af` | Network services |
| `storage` | **Dark Gray** | `#374151` | Storage services |

### Criticality Tags ⚠️

| Tag | Color | Hex | Description |
|-----|-------|-----|-------------|
| `critical` | **Dark Red** | `#991b1b` | Mission-critical systems |
| `high-priority` | **Orange-Red** | `#c2410c` | High priority |
| `medium-priority` | **Yellow-Orange** | `#d97706` | Medium priority |
| `low-priority` | **Light Green** | `#65a30d` | Low priority |
| `non-critical` | **Light Gray** | `#9ca3af` | Non-critical systems |

### Technology Tags 💻

| Tag | Color | Hex | Description |
|-----|-------|-----|-------------|
| `linux` | **Black** | `#000000` | Linux-based systems |
| `windows` | **Dark Blue** | `#1e3a8a` | Windows-based systems |
| `docker` | **Light Blue** | `#0ea5e9` | Docker containers |
| `kubernetes` | **Blue-Violet** | `#6366f1` | Kubernetes workloads |
| `vm` | **Dark Green** | `#166534` | Virtual machines |
| `lxc` | **Light Green** | `#22c55e` | LXC containers |

## Comprehensive Tag List

### Primary Service Tags

```bash
# Web Services
webserver           # Cyan (#0891b2)
web-frontend        # Light Cyan (#06b6d4)
web-backend         # Dark Cyan (#0e7490)
api-gateway         # Cyan-Green (#0891b2)
cdn                 # Light Blue (#38bdf8)

# Database Services
database           # Indigo (#4338ca)
db-primary         # Dark Indigo (#3730a3)
db-replica         # Light Indigo (#6366f1)
db-cache           # Violet (#8b5cf6)
redis              # Red-Violet (#a855f7)
elasticsearch      # Yellow-Green (#84cc16)

# Application Services
application        # Teal (#0d9488)
app-backend        # Dark Teal (#0f766e)
app-frontend       # Light Teal (#14b8a6)
microservice       # Turquoise (#06b6d4)
api-server         # Blue-Green (#059669)

# Infrastructure Services
infrastructure     # Gray (#6b7280)
load-balancer      # Dark Gray (#4b5563)
proxy              # Light Gray (#9ca3af)
dns                # Blue (#3b82f6)
dhcp               # Light Blue (#60a5fa)
ntp                # Indigo (#6366f1)

# Security Services
security           # Red (#dc2626)
firewall           # Dark Red (#b91c1c)
vpn                # Red-Orange (#ea580c)
ids-ips            # Orange (#f97316)
antivirus          # Yellow-Orange (#f59e0b)

# Monitoring & Logging
monitoring         # Violet (#7c3aed)
logging            # Dark Violet (#6d28d9)
metrics            # Light Violet (#a78bfa)
alerting           # Magenta (#d946ef)
grafana            # Orange (#f97316)
prometheus         # Red-Orange (#ea580c)

# Backup & Storage
backup             # Brown (#a3a3a3)
storage            # Dark Gray (#374151)
nas                # Gray (#6b7280)
san                # Dark Gray (#4b5563)
file-server        # Light Gray (#9ca3af)
```

### Project Tags

```bash
# Format: project-[name] - Color: Light Purple (#c084fc)
project-website
project-shop
project-crm
project-erp
project-mobile-app
project-data-migration
project-infrastructure-upgrade

# Customer Tags - Color: Pink (#ec4899)
customer-acme
customer-techcorp
customer-startup-xyz
client-enterprise-a
```

### Maintenance and Operations Tags

```bash
# Backup Tags - Color: Brown (#92400e)
auto-backup
manual-backup
backup-daily
backup-weekly
backup-monthly
no-backup

# Maintenance Tags - Color: Yellow (#eab308)
maintenance-sunday
maintenance-night
maintenance-planned
no-maintenance-window
auto-update
manual-update-only

# Availability Tags - Color: Green (#16a34a)
high-availability
load-balanced
clustered
standalone
single-point-failure

# Performance Tags - Color: Orange (#f97316)
high-performance
gpu-accelerated
cpu-intensive
memory-intensive
io-intensive
```

### Network Tags

```bash
# Network Segments - Color: Dark Blue (#1e40af)
dmz
internal
management
storage-network
backup-network
cluster-network

# VLAN Tags - Color: Blue (#3b82f6)
vlan-100
vlan-200
vlan-300
vlan-production
vlan-development
vlan-guest
```

### Compliance and Governance Tags

```bash
# Compliance - Color: Dark Red (#991b1b)
gdpr-relevant
pci-compliant
hipaa-compliant
sox-compliant
audit-required

# Governance - Color: Dark Gray (#374151)
cost-center-it
cost-center-sales
department-hr
department-finance
budget-approved
temporary-system
```

## Tag Combinations (Examples)

### Production Web Application
```bash
# Tags with colors
production          # Red
webserver           # Cyan
critical            # Dark Red
auto-backup         # Brown
high-availability   # Green
project-website     # Light Purple
vlan-production     # Blue
```

### Development Database
```bash
# Tags with colors
development         # Green
database            # Indigo
mysql               # Blue-Green
low-priority        # Light Green
backup-weekly       # Brown
project-crm         # Light Purple
vlan-development    # Blue
```

### Monitoring Server
```bash
# Tags with colors
production          # Red
monitoring          # Violet
prometheus          # Red-Orange
high-priority       # Orange-Red
auto-backup         # Brown
infrastructure      # Gray
management          # Dark Blue
```

## Proxmox-specific Implementation

### GUI Configuration

1. **Tag Creation in Proxmox Web Interface:**
   ```
   Datacenter → Tags → Add
   - Name: production
   - Color: #dc2626 (Red)
   - Description: Production systems
   ```

2. **Bulk Tag Assignment:**
   ```bash
   # CLI Example
   pvesh set /nodes/[node]/qemu/[vmid]/config -tags "production,webserver,critical"
   ```

### Automation with CLI

```bash
#!/bin/bash
# Tag setup script for new VMs

# Production Web VM
pvesh set /nodes/pve1/qemu/101/config -tags "production,webserver,critical,auto-backup,linux"

# Development Database
pvesh set /nodes/pve1/lxc/201/config -tags "development,database,mysql,low-priority,linux"

# Monitoring Server
pvesh set /nodes/pve1/qemu/151/config -tags "production,monitoring,prometheus,infrastructure,critical"
```

### Backup Job Configuration

```bash
# Production Systems - Daily
include-tags: production,critical
exclude-tags: no-backup,temporary-system
schedule: daily 02:00

# Development - Weekly
include-tags: development
exclude-tags: no-backup,sandbox
schedule: weekly sun 03:00

# Critical Systems - Multiple times daily
include-tags: critical,high-priority
schedule: "0 */6 * * *"  # Every 6 hours
```

### Monitoring Integration

```bash
# Prometheus/Grafana Dashboard Filters
# Critical Production Systems
tags =~ "production.*critical"

# All Web Services
tags =~ ".*webserver.*"

# Development Environment
tags =~ "development"
```

## Best Practices for Color Coding

### Visual Hierarchy

1. **Red Tones**: Critical and production systems
2. **Orange Tones**: Important but non-critical systems
3. **Green Tones**: Development and non-critical systems
4. **Blue Tones**: Infrastructure and network
5. **Purple Tones**: Monitoring and specialized services
6. **Gray Tones**: Basic services and storage

### Consistency Rules

- **Environment**: Always use the same color category
- **Service Type**: Similar services in similar color tones
- **Criticality**: Red spectrum for important systems
- **Projects**: Consistent color per project

### Accessibility

- **High contrast** for important tags
- **No pure color coding** - tags have meaningful names
- **Consistent color usage** across all environments

## Advanced Tagging Strategies

### Lifecycle Management

```bash
# Lifecycle Tags - Color: Purple (#9333ea)
lifecycle-new
lifecycle-active
lifecycle-deprecating
lifecycle-retiring
lifecycle-archived

# Migration Tags - Color: Orange (#f97316)
migration-source
migration-target
migration-in-progress
migration-completed
```

### Resource Management

```bash
# Resource Tags - Color: Teal (#0d9488)
resource-cpu-high
resource-memory-high
resource-storage-high
resource-network-high
resource-optimized

# Scaling Tags - Color: Green (#16a34a)
auto-scaling
manual-scaling
scale-up-candidate
scale-down-candidate
fixed-size
```

### Integration Tags

```bash
# CI/CD Integration - Color: Blue (#3b82f6)
ci-cd-enabled
build-server
deployment-target
testing-pipeline
staging-pipeline

# External Services - Color: Pink (#ec4899)
external-api
third-party-service
saas-integration
cloud-hybrid
on-premises-only
```

## Tag Governance

### Regular Reviews

- **Monthly**: Clean up unused tags
- **Quarterly**: Review color scheme
- **Bi-annually**: Optimize tag structure

### Team Guidelines

- **Use only approved tags**
- **Follow color scheme**
- **Keep documentation current**
- **Training for new team members**

### Automation and Compliance

```bash
# Tag Validation Script
#!/bin/bash
# Check for compliance with tagging standards

# List all VMs/Containers without environment tags
pvesh get /cluster/resources --type vm | jq -r '.[] | select(.tags | test("production|development|testing|laboratory|staging|sandbox") | not) | .name'

# List systems missing criticality tags
pvesh get /cluster/resources --type vm | jq -r '.[] | select(.tags | test("critical|high-priority|medium-priority|low-priority|non-critical") | not) | .name'
```

### Reporting and Analytics

```bash
# Generate tagging report
#!/bin/bash

echo "=== Proxmox Tagging Report ==="
echo "Environment Distribution:"
pvesh get /cluster/resources --type vm | jq -r '.[] | .tags' | grep -oE '(production|development|testing|laboratory|staging|sandbox)' | sort | uniq -c

echo "Service Distribution:"
pvesh get /cluster/resources --type vm | jq -r '.[] | .tags' | grep -oE '(webserver|database|application|monitoring|security|backup)' | sort | uniq -c

echo "Criticality Distribution:"
pvesh get /cluster/resources --type vm | jq -r '.[] | .tags' | grep -oE '(critical|high-priority|medium-priority|low-priority|non-critical)' | sort | uniq -c
```

## Troubleshooting Common Issues

### Tag Management Issues

1. **Duplicate Tags**: Use consistent naming conventions
2. **Color Conflicts**: Follow the established color scheme
3. **Missing Tags**: Implement validation scripts
4. **Inconsistent Application**: Regular team training

### Performance Considerations

- **Limit tag count** per VM/Container (recommended: max 10-15 tags)
- **Use hierarchical tagging** for complex categorizations
- **Regular cleanup** of unused tags
- **Monitor query performance** with large tag sets

---

**Version**: 1.0  
**Created**: [29.07.2025]  
**Last Updated**: [29.07.2025]  
**Responsible**: [IT Team]