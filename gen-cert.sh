#!/bin/bash

ca_name="DEV-CA"
host="app"

# Setting up certifiacte parameters.
sub="/C=RU/ST=Moscow/L=Moscow/O=ACME/CN=$host"

mkdir $host

echo "======================"
echo "CERT HOST: $host"
echo "======================"

openssl req -new -nodes -newkey rsa:4096 \
  -keyout $host/$host.key -out $host/$host.csr \
  -subj $sub

echo "==================="
echo "== CSR generated =="
echo "==================="

openssl x509 -req -sha512 -days 365 \
  -extfile x509.ext \
  -CA $ca_name/$ca_name.crt -CAkey $ca_name/$ca_name.key -CAcreateserial \
  -in $host/$host.csr \
  -out $host/$host.crt

rm $host/$host.csr

echo "==================="
echo "== CRT generated =="
echo "==================="
echo "Done."

pwd $host
ls $host