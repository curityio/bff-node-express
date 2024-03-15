#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

#
# Set environment variables
#
export PORT=444
export TRUSTED_WEB_ORIGIN='https://web.authsamples-dev.com'
export ISSUER='https://cognito-idp.eu-west-2.amazonaws.com/eu-west-2_CuhLeqiE9'
export AUTHORIZE_ENDPOINT='https://login.authsamples.com/oauth2/authorize'
export TOKEN_ENDPOINT='https://login.authsamples.com/oauth2/token'
export USERINFO_ENDPOINT='https://login.authsamples.com/oauth2/userInfo'
export LOGOUT_ENDPOINT='https://login.authsamples.com/logout'
export CLIENT_ID='7q5pope8rki7okarj2u8l4in7o'
export CLIENT_SECRET='1d18g4v05sesjkv161borl012j009l7ooktnfs10ph9p6nkbbfl9'
export REDIRECT_URI='https://web.authsamples-dev.com/spa/'
export POST_LOGOUT_REDIRECT_URI='https://web.authsamples-dev.com/spa/loggedout'
export SCOPE='openid profile https://api.authsamples.com/investments'
export COOKIE_DOMAIN='api.authsamples-dev.com'
export COOKIE_NAME_PREFIX='mycompany'
export COOKIE_ENCRYPTION_KEY='d26d160214a85a2aa9dc80487e0c24b33d1594bda7b0e1954e99fde54f6486df'
export CORS_ENABLED='true'
export SERVER_CERT_P12_PATH='./certs/authsamples-dev.ssl.p12'
export SERVER_CERT_P12_PASSWORD='Password1'

#
# Then run the OAuth agent
#
node --loader ts-node/esm --no-warnings src/server.ts