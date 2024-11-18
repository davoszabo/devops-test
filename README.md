# Overview
This Ansible project is there for provisioning Debian 11 VMs and install the required tools, create and apply configurations, and run scripts.

# Getting started
The project description does not contain section for setting up the development environment. The recommended way is to use the devcontainer feature, either the `VS Code extension` or `devcontainer-cli`. The Dockerfile for the development image contains the required packages inside `.devcontainer/` if you want to install them manually.

The project based on single source of truth. This means there is only one main configuration file that can be edited. Advanced configurations can be applied also inside roles.

Create a copy from `inventory/template.yaml` and rename it inside the same directory. Edit the copied inventory file to reach the desired state for the environment.

# Features
The full cycle from creating VMs to apply all necessary configurations can be found in the project.

## Terraform
Provision VM via Terraform is supported. Currently only these providers present:
- Proxmox (cloud-init)

  The [CLOUD INIT QUIDE](CLOUD_INIT_QUIDE.md) leads you how to create the Debian 11 cloud-init template for Proxmox.

Command for provision via Terraform:
```
ansible-playbook playbooks/terraform_provision.yaml
```

Check mode can be used for `terraform plan`:
```
ansible-playbook playbooks/terraform_provision.yaml --check
```

## Apply configurations
The `base` role consists of many installation and configuration related tasks.

```
ansible-playbook playbooks/base_config.yaml
```

It is possible that the configurations will edit the port for reaching SSH. Add environment variable to modify the port number:
```
ansible-playbook playbooks/base_config.yaml -e ansible_port=23
```

## Docker project
Apply dynamically created docker-compose file and start containers.

```
ansible-playbook playbooks/docker_setup.yaml
```

## Run scripts
If everything is set, scripts are ready to be deployed.

```
ansible-playbook playbooks/run_scripts.yaml
```

## Jenkins project
`COMING SOON`
