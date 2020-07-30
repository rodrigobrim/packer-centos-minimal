#!/bin/sh -eux

msg='
Este sistema foi construído por Rodrigo Brim, utilizando as seguintes ferramentas:
Ansible
Packer
Vagrant
Virtualbox
Que a força esteja com vc!
'

if [ -d /etc/update-motd.d ]; then
    MOTD_CONFIG='/etc/update-motd.d/99-rodrigobrim'

    cat >> "$MOTD_CONFIG" <<MOT
#!/bin/sh

cat <<'EOF'
$msg
EOF
MOT

    chmod 0755 "$MOTD_CONFIG"
else
    echo "$msg" >> /etc/motd
fi
