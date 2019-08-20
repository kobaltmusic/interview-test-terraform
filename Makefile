apigateway=4567
cloudformation=4581
cloudwatch=4582
cloudwatchlogs=4586
dynamodb=4569
ec2=4597
es=4578
firehose=4573
iam=4593
kinesis=4568
lambda=4574
route53=4580
redshift=4577
s3=4572
secretsmanager=4584
ses=4579
sns=4575
sqs=4576
ssm=4583
stepfunctions=4585
sts=4592

up: down
	rm -rf ./src/.terraform* ./src/terraform*
	docker-compose pull --ignore-pull-failures
	docker-compose build --pull
	docker-compose up localstack

down:
	docker-compose down --volumes

init: CMD=init
init: terraform

plan: CMD=plan
plan: terraform

apply: CMD=apply
apply: terraform

destroy: CMD=destroy
destroy: terraform

aws: PORT=$($(SERVICE))
aws:
	docker-compose run --rm aws --endpoint-url=http://localstack:$(PORT) $(SERVICE) $(CMD)

terraform:
	docker-compose run --rm terraform $(CMD)
