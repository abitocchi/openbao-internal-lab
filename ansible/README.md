# ansible installation

this folder contains instructions and resources to install OpenBao with ansible

## after playbook execution

log into the first vm with the command
```
vagrant ssh openbao1
```

become root
```
sudo -i
```

check if the container is running
```
podman ps
```

if it's running it has to be unsealed so enter into the container
```
podman exec --tty -it openbao /bin/sh
```

and exec the following comand and take note of the unseal key
```
export VAULT_SKIP_VERIFY=true
bao operator init
```

this is an example of the output returned
```
#openbao1
Unseal Key 1: bhwIkkpcIYTTP07jXBZmbZhI4Bius10sWwohGoz6wcWw
Unseal Key 2: mClrDjj36adwiWKfC1B8s7HgbUFs4L2uPsmSfc1Lxu+K
Unseal Key 3: BkikJ9Zs+TqJGzfmRtHfS/QxHOiSvpfhJ1Ed89O7lzVS
Unseal Key 4: mVa6cEFDgWkDZjz40phwzTqmrk1tXJRSV9vWrFthQFhh
Unseal Key 5: NZs2GvdhX7qUIiqA7aJms2zF086wjDyWHHY8EgDjoo8I

Initial Root Token: s.AdTIiKSCJ4A3tLPDuZMVkWgm
```

```
#openbao2
Unseal Key 1: 5VsqBQpkTjOVzEqAXihmhPiQI44w/j/PC1lGx8ci8EH0
Unseal Key 2: NtXVjZYQakyJdiaemechFr9HWnwGJHWy5IPLAGnJZnLs
Unseal Key 3: Ub/pMQeHel5MN5Aobinz2pg6GtTw+Eq2EFJEdhusAzxF
Unseal Key 4: LShPmTfHnJYnlnD8JeWhzffHkl8oMfnDsgUeUkLAXVlT
Unseal Key 5: Z2u9yzFK0PfspBWCU2psx68TAWZZUtpjHrg6SiedBDGv

Initial Root Token: s.QmYk9nwhIkhWL2aZjfKYkg6O
```

```
#openbao3
Unseal Key 1: NfZWLyRUCknscGQMXhebadtZCrxkoL72hyk0vaMzdiOT
Unseal Key 2: WwswYRLjEMJAXfPQDQKCS4hmhJX3iWURHTDM7bTZZnA7
Unseal Key 3: AUWGfRRjlfkoREfWj3Sv/AzBiPuy2bvAajsBR2i4cyY+
Unseal Key 4: sgRkLlirTviW/57LvW+dnI0yv6kmgVk4Lvmli1tgXwIL
Unseal Key 5: XrC8HKjarPwd2cv0a1e39sfvm6/LXChcKU5Rkd2WILeS

Initial Root Token: s.ZAGcnwIUjyIHw84Osb37U0mM
```

then run the command to unseal and provide one of the key obtained with the previous command, you have to unseal each server one by one
```
bao operator unseal
```