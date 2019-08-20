# Interview Test Terraform

## Usage

All aspects of this exercise have been Dockerised, to run this on a local machine (or server) all you need is Docker installed.

### Localstack

> Be aware, Localstack only emulates AWS and does NOT emulate all AWS services.

For initial startup, localstack needs to be running.  
The following command will build and start up a "clean" environment.

```shell script
$ make up
```

Once finished, cleanup can be done with the following command.

```shell script
$ make down
```

### Terraform

The "main" commands have been abstracted to the Makefile to work with Docker.

```shell script
$ make init
$ make plan
$ make apply
$ make destroy
```

If for any reason, you want more flexibility on these commands (or use other commands), you can do so using the following.

```shell script
$ CMD=init make terraform
$ CMD=plan make terraform
$ CMD=apply make terraform
$ CMD=destroy make terraform
```

### AWS CLI

The AWS CLI has also been abstracted into the Makefile and needs a simple translation to work with any CLI command.

```shell script
$ SERVICE=ec2 CMD=describe-instances make aws
```
