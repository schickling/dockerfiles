# swagger-ui

Swagger UI 2.1.3 with API_URL and API_KEY injection (45 MB)

## Usage

```sh
$ docker run -d -p 80:80 -e API_URL=http://localhost:4000/swagger schickling/swagger-ui
```

### Variables

* `API_URL` - Swagger endpoint for your API
* `API_KEY` - Default API Key (optional)
* `PORT`    - Default port to run on (optional)
* `VALIDATOR_URL` - Swagger validator (optional)
