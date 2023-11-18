# Cloud Infrastructure

## Install Terraform

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

## Install or update the latest version of the AWS CLI

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

## Create key pairs

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html

## Using Terraform to deploy BTC nodes on AWS infrastructure.

This code:

- Spins up a Linux EC2 instance in its own VPC and subnet.
- Configure it to run `bitcoind` (set the `prune` option).
- Output the IP address or domain name.

Uses S3 for the backend and handle locking.

## Terraform

terraform int  
terraform plan  
terraform apply

disclaimer: this code needs more attention, it was done in a fast pace due to unexpected events and a fixed deadline
