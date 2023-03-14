#!/bin/bash
terraform init
terraform apply -auto-approve
echo "Run again to get PIP"
terraform apply -auto-approve
ip=$(terraform output -raw public_ip)
ansible-playbook playbook.yaml -i ${ip}, --user=adminuser --ssh-extra-args '-o StrictHostKeyChecking=no'
