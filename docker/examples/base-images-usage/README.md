# Examples

This is an example of usage of base docker images.

## Structure

The example consists of `app` and `image` folders.
`image` is the image context and dockerfiles
`app` is an app that GAD pulls and deploys.


## Example of "git-auto-deploy" usage
This is an example of usage of "git-auto-deploy" docker image.

Example docker image extends "git-auto-deploy"
by adding a non-root user and configuration and exposing port.
Also it specifies addition run option `--ssh-keyscan` in CMD that attaches
to ENTRYPOINT of the parent image. `--ssh-keyscan` isn't actually used but
it's addef for example only.

### How to run the example

    cd docker/example/base-images-usage/image
    docker build -t the-example -f gad-base-based.Dockerfile .
    docker run --init --rm -p 8080:8080 the-example

Look at [--init](https://docs.docker.com/engine/reference/run/#specify-an-init-process) flag in the snippet above.
I think it's important to use it because GAD is supposed to run deployment scripts,
that means we have a lot of child processes in the container
that should be utilized properly.

## Example of "gitautodeploy-ch" usage
This is an example of usage of "gitautodeploy-ch" docker image.

Example docker image extends "gitautodeploy-ch"
by adding configuration and exposing 8080 port that matches the configuration.
Also it specifies addition run option `--ssh-keyscan` in CMD that attaches
to ENTRYPOINT of the parent image. `--ssh-keyscan` isn't actually used but
it's addef for example only.

### How to run the example

    cd docker/example/base-images-usage/image
    docker build -t the-example -f gad-ch-based.Dockerfile .
    docker run --rm -p 8080:8080 the-example

You don't need to use [--init](https://docs.docker.com/engine/reference/run/#specify-an-init-process) with this image
because it enforses to use [dumb-init](https://github.com/Yelp/dumb-init).
