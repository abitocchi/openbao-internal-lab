# kv engine

## initial steps

Enable kv secrets engine
```bash
bao secrets enable kv
bao secrets enable kv-v2
```

## test secret creation

Create a simple secret
```bash
bao kv put -mount=kv foo bar=baz
```

Retrieve the secret
```bash
bao kv get -mount=kv foo
```
## automated tests

It's possible to run a script to perform a series of automated tests, please check the exported variables inside the script and change them according to your configuration
```bash
./tests/0-kv.sh
```

## policy creation

Create a policy with the following command
```bash
bao policy write kv-policy policy/kv.hcl
```