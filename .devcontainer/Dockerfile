FROM mcr.microsoft.com/devcontainers/python:3.12-bookworm

# Install Ansible essentials and dev tools
RUN pip install ansible==10.6.0

RUN pip install ansible-dev-tools==24.10.2

# Install Terraform
RUN curl -LO "https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip" \
    && unzip terraform_*.zip \
    && mv terraform /usr/local/bin/ \
    && rm -rf terraform_*.zip

# Install extras for Terraform and ansible
RUN pip install jmespath==1.0.1

