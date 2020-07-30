# packer-centos-minimal

## Vagrant Box do Centos 8 minimal para construir com o Packer

**Versão do CentOS utilizada**: 8.2 (2004)

## Requisitos

Ansible (testado no 2.9)
Packer (testado no 1.6)
Vagrant (testado no 2.2.9)
Virtualbox (testado no 6.1.12)

## Para fazer o build, execute:

```
ansible-playbook install_dependencies.yml build.yml
```

## Customizações

[Altere o template jinja](templates/packer-config.json.j2)
[Nomes / variáveis](config.yml)
