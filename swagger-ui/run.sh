#! /bin/sh

set -e

if [ "$API_KEY" != "**None**" ]; then
  sed -i "s|/\*||g" index.html
  sed -i "s|\*/||g" index.html
  sed -i "s|myApiKeyXXXX123456789|$API_KEY|g" index.html
fi

sed -i "s|http://petstore.swagger.io/v2/swagger.json|$API_URL|g" index.html
sed -i "s|http://example.com/api|$API_URL|g" index.html

http-server -p 80
