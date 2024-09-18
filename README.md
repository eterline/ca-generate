
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

# How to set it

## Apache
```
<VirtualHost 192.168.0.1:443>     
  ...
  ServerName local.dev
  SSLEngine on
  SSLCertificateFile /path/to/localhost.crt
  SSLCertificateKeyFile /path/to/localhost.key
  ...
</VirtualHost>
```

## NGINX
```
server {
  listen 443;
  ssl on;
  ssl_certificate /path/to/localhost.crt;
  ssl_certificate_key /path/to/localhost.key;
  ...
}
```

## webpack DevServer
```
webpack-dev-server  --open --https \
  --cert /path/to/localhost.crt \
  --key /path/to/localhost.key
```

## Express.js
```
const https = require("https");
const fs = require("fs");
const express = require("express");

const key = fs.readFileSync("localhost.key");
const cert = fs.readFileSync("localhost.crt");

const app = express();

const server = https.createServer({ key, cert }, app);

app.get("/", (req, res) => {
  res.send("this is an secure server");
});

server.listen(8000, () => {
  console.log("listening on 8000");
});
```