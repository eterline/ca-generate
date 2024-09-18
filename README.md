
# ca-generate

Generate local self-signed certificates


## Run

To generate CA key and CRT (Name edit in file)
```bash
  ./gen-ca.sh
```
To generate host key and CRT (Name edit in file)
```bash
  ./gen-ca.sh
```


## x509.ext

Pre settings (Edit if you know what is that!!!)
```
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
```

Localhost names and domains
```
[alt_names]
# Localhost
DNS.1 = localhost
DNS.2 = 127.0.0.1
DNS.3 = ::1 
# List of domain names (can be ips)
DNS.4 = local.dev
DNS.5 = 192.168.0.15
```

