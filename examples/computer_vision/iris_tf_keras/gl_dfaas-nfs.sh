#!/bin/bash  
mkdir -p /mnt/pollen \
&& apt update && apt install ssh nfs-common wget unzip -y \
&& wget https://releases.hashicorp.com/vault/1.12.4/vault_1.12.4_linux_amd64.zip -O /tmp/vault_1.12.4_linux_amd64.zip \
&& unzip /tmp/vault_1.12.4_linux_amd64.zip -d /tmp \
&& chmod +x /tmp/vault \
&& mv /tmp/vault /usr/local/bin \
&& export VAULT_ADDRESS=http://10.69.41.96:8200/ \
&& vault login --address=$VAULT_ADDRESS `cat /var/vault-token/vault-token-value` \
&& vault kv get --field=gl_id_rsa --address=$VAULT_ADDRESS pollen/iateam/gl-dfaas > /tmp/id_rsa_datafabric.pem \
&& chmod 0400 /tmp/id_rsa_datafabric.pem \
&& ssh -i /tmp/id_rsa_datafabric.pem -o 'StrictHostKeyChecking no' -4 dfaasusr@16.103.6.95 -L 2049:localhost:2049 -N -f \
&& ssh -i /tmp/id_rsa_datafabric.pem -o 'StrictHostKeyChecking no' -4 dfaasusr@16.103.6.95 -L 111:localhost:111 -N -f \
&& mount -v -t nfs -o vers=3,port=2049,nolock,rw,proto=tcp,mountproto=tcp localhost:/fabrics/GL-DF-Beta/pollen /mnt/pollen \
&& rm -f /tmp/id_rsa_datafabric.pem 
