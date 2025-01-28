# transit engine

## initial steps

Enable transit secrets engine
```bash
bao secrets enable transit
```

## test encryption key creation

Create an encryption key by running
```bash
bao write -f transit/keys/my-key
```

this is the expected output
```
Key                       Value
---                       -----
allow_plaintext_backup    false
auto_rotate_period        0s
deletion_allowed          false
derived                   false
exportable                false
imported_key              false
keys                      map[1:1738076867]
latest_version            1
min_available_version     0
min_decryption_version    1
min_encryption_version    0
name                      my-key
soft_deleted              false
supports_decryption       true
supports_derivation       true
supports_encryption       true
supports_signing          false
type                      aes256-gcm96
```

## test plain text encryption

To encrypt a plaintext run the command
```bash
bao write transit/encrypt/my-key plaintext=$(echo "my secret data" | base64)
```

this is the expected output
```
Key            Value
---            -----
ciphertext     vault:v1:4TbfWCI5T06n8l56KhfpZLoCU1xgz7JtQZ9o3N32iCKBd+k/OGRFbeXTew==
key_version    1
```

**NOTE**: all plaintext data must be base64-encoded.

## test cipher text decryption

To decrypt a ciphertext run the command
```bash
bao write transit/decrypt/my-key ciphertext=vault:v1:4TbfWCI5T06n8l56KhfpZLoCU1xgz7JtQZ9o3N32iCKBd+k/OGRFbeXTew==
```

this is the expected output
```
Key          Value
---          -----
plaintext    bXkgc2VjcmV0IGRhdGEK
```

**NOTE**: it's base64 encoded so to convert run
```
bao write transit/decrypt/my-key ciphertext=vault:v1:4TbfWCI5T06n8l56KhfpZLoCU1xgz7JtQZ9o3N32iCKBd+k/OGRFbeXTew== | grep plaintext | awk '{print $2}' | base64 --decode
```

the expected output is
```
my secret data
```