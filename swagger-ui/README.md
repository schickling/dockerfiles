# swagger-ui

Swagger UI 2.2.10 with API_URL, API_KEY and OAUTH2 injection (45 MB)

## Usage

```sh
$ docker run -d -p 80:80 -e API_URL=http://localhost:4000/swagger schickling/swagger-ui
```

### Variables

* `API_URL` - Swagger endpoint for your API
* `API_KEY` - Default API Key (optional)
* `PORT` - Default port to run on (optional)
* `VALIDATOR_URL` - Swagger validator (optional)
* `OAUTH_CLIENT_ID` - oAuth2 client ID (optional, use empty to remove)
* `OAUTH_CLIENT_SECRET` - oAuth2 client secret (optional, use empty to remove)
* `OAUTH_REALM` - oAuth2 realm (optional, use empty to remove)
* `OAUTH_APP_NAME` - oAuth2 app name (optional, use empty to remove)
* `OAUTH_ADDITIONAL_PARAMS` - oAuth2 query string additional params (optional)

Variable value `**None**` should not be used for above defined variables.