# Docker support

## Docker support for Pharo

Launchpad provides a Docker image that can be used as base for containerized
applications. It's built on top of [pharo:v11.0.0](https://github.com/ba-st/docker-pharo-runtime),
adding some useful scripts for Launchpad-based applications:

- `launchpad` starts the CLI
- `launchpad-explain` starts the CLI with the `explain` command
- `launchpad-list` starts the CLI with the `list` command
- `launchpad-start` starts the CLI with the `start` command and set up
  a `SIGTERM` handler for gracefully stopping the application.
- `launchpad-healthcheck` is run as the default docker `HEALTHCHECK`

### How to use as base pharo docker image

In your Dockerfile put something like:

```docker
FROM ghcr.io/ba-st/pharo-loader:v11.0.0 AS loader
# Load your own application
RUN pharo metacello install github://owner/repo:branch BaselineOfProject

FROM ghcr.io/ba-st/launchpad:v5
COPY --from=loader /opt/pharo/Pharo.image ./
COPY --from=loader /opt/pharo/Pharo*.sources ./

# Your own directives

CMD [ "launchpad-start", "app-name" , "--parameter=value" ]
```

### Environment variables

- `LAUNCHPAD__COMMAND_SERVER_PORT` defines in which port is listening the TCP
  command server. Defaults to 22222.
- `LAUNCHPAD__LOG_FORMAT` can be set to `json` to enable structured logging

## Docker support for GemStone/S 64

Launchpad provides a Docker image that can be used as base for containerized
gems. It's built on top of [gs64-gem:v3.7.0](https://github.com/ba-st/Docker-GemStone-64)
and [gs64-gem:v3.7.1](https://github.com/ba-st/Docker-GemStone-64),
adding some useful scripts for Launchpad-based applications:

- `launchpad` starts the CLI

### How to use as base gem docker image

In your Dockerfile put something like:

```docker
# FROM ghcr.io/ba-st/launchpad-gs64-3.7.0:v5
FROM ghcr.io/ba-st/launchpad-gs64-3.7.1:v5

# Your own directives

CMD [ "launchpad", "start", "app-name" , "--parameter=value" ]
```

> Note that `ghcr.io/ba-st/launchpad-gs64` packages are deprecated and not receiving
> more updates. Use `ghcr.io/ba-st/launchpad-gs64-3.7.0` instead.
