# multi-stage-go

This is a demo on how to build a small Docker image with [Alpine Linux](https://alpinelinux.org/) and Dockers
[multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) feature that includes go cli tools.

To build the container:

    docker build -t janahrens/multi-stage-go:latest .

To use the container:

    docker run -v $PWD:/root -it janahrens/multi-stage-go:latest ./check.sh schema.yaml invalid-document.yaml

Check the containers contents and size:

    docker image ls janahrens/multi-stage-go:latest
    docker create --name tmp_$$ janahrens/multi-stage-go:latest
    docker export tmp_$$ | tar tv | sort -k5 -r | head
    docker rm tmp_$$