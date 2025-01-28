Role Name
=========

An OpenBao cluster installer

Role Variables
--------------

```yaml
user: 1000

image:
  registry: quay.io/openbao/openbao
  tag: 2.1.1

config:
  path: /containers_vols/openbao

storage:
  host:
    data: /containers_vols/openbao/data
  
  container:
    data: /openbao/data

certs:
  host:
    private_key_path: /containers_vols/openbao/certs/private.key
    certificate_path: /containers_vols/openbao/certs/certificate.pem

  container:
    certificate_path: /openbao/certs/certificate.pem
    private_key_path: /openbao/certs/private.key
    caCertificate: /openbao/certs/ca.pem
```

Dependencies
------------

- containers.podman
- community.crypto

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- name: Deploy OpenBao server
  hosts: all
  become: true

  roles:
    - role: openbao
      vars:
        certs:
          localhost:
            private_key_path: certs/private.key
            certificate_path: certs/certificate.pem
            caCertificate: certs/ca.pem
          host:
            private_key_path: /containers_vols/openbao/certs/private.key
            certificate_path: /containers_vols/openbao/certs/certificate.pem
            caCertificate: /containers_vols/openbao/certs/ca.pem
          container:
            certificate_path: /openbao/certs/certificate.pem
            private_key_path: /openbao/certs/private.key
            caCertificate: /openbao/certs/ca.pem
```

License
-------

GPL

