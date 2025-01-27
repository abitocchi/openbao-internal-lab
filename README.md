# openbao-internal-lab

## generate certificates
```
openssl genrsa -out openbao-internal.key 2048

openssl req -new -sha256 -key openbao-internal.key -subj "/C=IT/ST=RM/O=Sourcesense/CN=openbao.lab.local" -out openbao-internal.csr

openssl x509 -req -in openbao-internal.csr  -out openbao-internal.crt -days 500 -sha256
```