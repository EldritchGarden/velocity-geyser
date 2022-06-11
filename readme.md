# Velocity + Geyser
This docker image is a (stable) WIP [Velocity](https://velocitypowered.com/)
server, combined with [Geyser](https://geysermc.org/).

The container runs a Velocity server along with the Geyser and Floodgate plugins.
By default the latest builds for Velocity 3.1.1, Geyser, and Floodgate are
downloaded when the container starts, and will automatically update when
new builds are released.

#### DockerHub
I will add a link here once the image is up on Docker Hub

#### Building
To build from source just clone the repository and run
`docker build [-t <name>] velocity-geyser/`

## Running
WIP

## Configuration
See the [Velocity Docs](https://velocitypowered.com/wiki/users/configuration/)
for configuring velocity. All velocity options should be configured through the
velocity config. DO NOT CHANGE the bind address, instead you can
set the port to use with docker's port option: `-p <port>:25577`

### ENV Options
WIP
