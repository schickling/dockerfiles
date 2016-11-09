#! /bin/sh

set -e

replace_in_index () {
  if [ "$1" != "**None**" ]; then
    sed -i "s|/\*||g" index.html
    sed -i "s|\*/||g" index.html
    sed -i "s|$1|$2|g" index.html
  fi
}

replace_or_delete_in_index () {
  if [ -z "$2" ]; then
    sed -i "/$1/d" index.html
  else
    replace_in_index $1 $2
  fi
}

replace_in_index myApiKeyXXXX123456789 $API_KEY
replace_or_delete_in_index your-client-id $OAUTH_CLIENT_ID
replace_or_delete_in_index your-client-secret-if-required $OAUTH_CLIENT_SECRET
replace_or_delete_in_index your-realms $OAUTH_REALM
replace_or_delete_in_index your-app-name $OAUTH_APP_NAME
if [ "$OAUTH_ADDITIONAL_PARAMS" != "**None**" ]; then
    replace_in_index "additionalQueryStringParams: {}" "additionalQueryStringParams: {$OAUTH_ADDITIONAL_PARAMS}"
fi

if [[ -f $SWAGGER_JSON ]]; then
  sed -i "s|http://petstore.swagger.io/v2/swagger.json|swagger.json|g" index.html
  sed -i "s|http://example.com/api|swagger.json|g" index.html
else
  sed -i "s|http://petstore.swagger.io/v2/swagger.json|$API_URL|g" index.html
  sed -i "s|http://example.com/api|$API_URL|g" index.html
fi

if [[ -n "$VALIDATOR_URL" ]]; then
  sed -i "s|.*validatorUrl:.*$||g" index.html
  sed -i "s|\(url: url,.*\)|\1\n        validatorUrl: \"${VALIDATOR_URL}\",|g" index.html
fi

exec http-server -p $PORT $*
