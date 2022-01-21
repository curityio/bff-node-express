# How to Run the Token Handler Locally

Follow the below steps to get set up for developing and testing the token handler itself.

## Prerequisites

Ensure that these tools are installed locally:

- [Node.js](https://nodejs.org/en/download/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [jq](https://stedolan.github.io/jq/download/)

Also get a license file for the Curity Identity Server:

- Sign in to the [Curity Developer Portal](https://developer.curity.io/) with your Github account.
- You can get a [Free Community Edition License](https://curity.io/product/community/) if you are new to the Curity Identity Server.

## Update your Hosts File

Ensure that the hosts file contains the following development domain names:

```text
127.0.0.1  api.example.local login.example.local
:1 localhost
```

## Understand URLs

For local development of the token handler the following URLs are used, with HTTP to reduce development infrastructure:

| Component | Base URL | Usage |
| --------- | -------- | ----- |
| Token Handler API | http://api.example.local:8080/tokenhandler | This acts as a Back End for Front End for SPAs |
| Curity Identity Server | http://login.example.local:8443 | This will receive a Mutual TLS secret from the token handler |

If you want to update to an HTTPS setup, see the use of OpenSSL certificates in the [Financial-grade Token Handler](https://github.com/curityio/token-handler-kotlin-spring-fapi).

## Build and Run the Token Handler API

Run these commands from the root folder and the API will then listen on HTTP over port 8080:

```bash
npm install
npm start
```

Test that the API is contactable by running this command from the root folder:

```bash
curl -X POST http://api.example.local:8080/tokenhandler/login/start \
-H "origin: http://www.example.local" | jq
```

## Deploy the Curity Identity Server

Copy a license file into the `test/idsvr` folder and then run the following commands:

```bash
cd test/idsvr
./deploy.sh
```

## Test the Token Handler API

The test script can then be used to verify the token handler's operations using the curl tool:

```bash
cd test
./test-token-handler.sh
```

![API Tests](api-tests.png)

## Free Docker Resources

When finished with your development session, free Docker resources like this:

```bash
cd test/idsvr
./teardown.sh
```