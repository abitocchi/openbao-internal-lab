# ansible installation

this folder contains instructions and resources to install OpenBao with ansible

## after playbook execution

log into the first vm with the command
```bash
vagrant ssh openbao1
```

become root
```bash
sudo -i
```

check if the container is running
```bash
podman ps
```

if it's running it has to be unsealed so enter into the container
```bash
podman exec --tty -it openbao /bin/sh
```

and exec the following comand and take note of the unseal key
```bash
export VAULT_SKIP_VERIFY=true
bao operator init
```

this is an example of the output returned
```
Unseal Key 1: Vp32H0G0wLebgMdMFdIT4pInr126WZdayGOP0EMTYCX+
Unseal Key 2: 8a48f7geYHDjMWd/YoDIpFqhfskFd4BiK9w3f0YadiWG
Unseal Key 3: mUAKGHMA7lvGkK627bTMBU2QdXSBwJz80mA3tcbdZqBP
Unseal Key 4: EhZvsWFrpPDog0JKurOWE8uCs43epfEdRjhu3ULdDdXx
Unseal Key 5: TuyLp0uRvkKfDiaQf90Mma2Ikarc54rxtmPk1/gvsoe0

Initial Root Token: s.BqHpxZ0akNYPF21vx4gKs4Kg

Vault initialized with 5 key shares and a key threshold of 3. Please securely
distribute the key shares printed above. When the Vault is re-sealed,
restarted, or stopped, you must supply at least 3 of these keys to unseal it
before it can start servicing requests.

Vault does not store the generated root key. Without at least 3 keys to
reconstruct the root key, Vault will remain permanently sealed!

It is possible to generate new unseal keys, provided you have a quorum of
existing unseal keys shares. See "bao operator rekey" for more information.
```

then run the command to unseal and provide three keys obtained with the previous command

```bash
bao operator unseal
```

once the vault has been unsealed perform the login into the other 2 vms and start the pods
```bash
# for openbao2
vagrant ssh openbao2
sudo -i
podman start openbao

# for openbao3
vagrant ssh openbao3
sudo -i
podman start openbao
```