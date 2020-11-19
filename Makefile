SHELL        := $(shell which bash)
.SHELLFLAGS = -c

.SILENT: ;               # no need for @
.ONESHELL: ;             # recipes execute in same shell
.NOTPARALLEL: ;          # wait for this target to finish
.EXPORT_ALL_VARIABLES: ; # send all vars to shell

DOCKER_IMAGE=reqres_tester:latest
DOCKER_CONTAINER_NAME=local_reqres_tester
REST_API=https://reqres.in/api/users

help:
	echo Project makefile

build: ##building docker image
	echo building image
	docker build -t ${DOCKER_IMAGE} .

start: ##start the application
	echo starting image
	docker run --name ${DOCKER_CONTAINER_NAME} --env REST_API=${REST_API} --mount type=bind,source=$(PWD)/out,target=/out --rm ${DOCKER_IMAGE}

test:
	docker run --name ${DOCKER_CONTAINER_NAME} --env REST_API=${REST_API} --mount type=bind,source=$(PWD)/out,target=/out --rm ${DOCKER_IMAGE} pytest test.py

buildandstart: build start

buildandtest: build test
