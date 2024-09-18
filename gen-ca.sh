#!/bin/bash

sb="/C=RU/CN=DEV-CA"
ca_name="DEV-CA"

mkdir $ca_name

openssl req -x509 -nodes -new -sha512 \
  -days 365 -newkey rsa:4096 -keyout $ca_name/$ca_name.key \
  -out $ca_name/$ca_name.pem -subj ${sb}

echo "CA KEY and PEM generated"

openssl x509 -in $ca_name/$ca_name.pem -text -noout
openssl x509 -outform pem -in $ca_name/$ca_name.pem -out $ca_name/$ca_name.crt

echo "========================="
echo "== ROOT CERT generated =="
echo "========================="
ls $ca_name