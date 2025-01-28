# totp engine

The TOTP secrets engine can act as a TOTP code generator, like Google Authenticator

## initial steps

Enable totp secrets engine
```bash
bao secrets enable totp
```

## configure key

```bash
bao write totp/keys/my-key \
    url="otpauth://totp/OpenBao:test@test.com?secret=Y64VEVMBTSXCYIWRSHRNDZW62MPGVU2G&issuer=OpenBao"
```

## generate code

to get a code exec
```bash
bao read totp/code/my-key
```


## configure as a provider

```bash
bao write totp/keys/my-user \
    generate=true \
    issuer=OpenBao \
    account_name=user@test.com
```

this is the expected output
```
Key        Value
---        -----
barcode    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
url        otpauth://totp/OpenBao:user@test.com?algorithm=SHA1&digits=6&issuer=OpenBao&period=30&secret=PIYXUZJXX6VRWYGNRKGOYS7EWSP6DLLL
```

then write the url into `totp/keys/my-key`

```bash
bao write totp/keys/my-key \
    url="otpauth://totp/OpenBao:user@test.com?algorithm=SHA1&digits=6&issuer=OpenBao&period=30&secret=PIYXUZJXX6VRWYGNRKGOYS7EWSP6DLLL"
```

## validate the code

to get a code exec
```bash
bao read totp/code/my-key
```
to validate the code run
```bash
bao write totp/code/my-user code=483031
```
this is the expected output
```
Key      Value
---      -----
valid    true
```