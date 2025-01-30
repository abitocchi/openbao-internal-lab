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
export BAO_SKIP_VERIFY=true
bao operator init
```

this is an example of the output returned
```
Unseal Key 1: keus1CHD+1uDnvvm3yN8wDQ46r5Eza7Nv0H/GyqCMG0Y
Unseal Key 2: MRGLedANldkvfaS5eXfOHTtM+vMyDVw0vVD7gzdh6LkF
Unseal Key 3: RRdmCyeIdPvCgQDLsgsJ96h44ARERyKt9499V+uauq2F
Unseal Key 4: tPmu6p4bwfns4S9nk3pHi70VrbL1c12Vzflq1iVnE+R4
Unseal Key 5: DkJ7rh84fPwG304Jb7IHLFMbMMot+xlPCeVUaO0Qnu0f

Initial Root Token: s.KS4YsHiJC4rI3p2dzU2X1M4b

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
podman exec --tty -it openbao /bin/sh
bao operator unseal
# provide three keys

# for openbao3
vagrant ssh openbao3
sudo -i
podman start openbao
podman exec --tty -it openbao /bin/sh
bao operator unseal
# provide three keys
```