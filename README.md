# packer-centos-minimal

## Centos 8 minimal Vagrant Box packer automation

** CentOS version**: 8.3 (2011)

## Requirements

Ansible (testado no 2.10)
Packer (testado no 1.7)
Vagrant (testado no 2.2.15)
Virtualbox (testado no 6.1.22)
Export access_token variable (generate it in: https://app.vagrantup.com/settings/security)

## To build, do it:

```
ansible-playbook install_dependencies.yml build.yml -e access_token=${access_token}
```

## Customizations

[Altere o template jinja](templates/packer-config.json.j2)
[Nomes / variáveis](config.yml)
