#!/bin/bash

terraform init

# provision eks cluster and its dependent resources first
terraform plan -out tfplan -target=module.eks
terraform apply tfplan

# provision the remaining resources including bootstrap resources which depends on the existing cluster

# Initialize counter
counter=0
max_attempts=10

# Loop until 'kubectl get svc' returns successfully or counter reaches max_attempts
while [ $counter -lt $max_attempts ]; do
  # Run 'kubectl get svc' and capture its return status
  kubectl get svc > /dev/null 2>&1
  
  if [ $? -eq 0 ]; then
    echo "Service list retrieved successfully. Exiting loop."
    break
  else
    echo "Failed to retrieve services. Attempt $((counter+1)) of $max_attempts. Retrying in 15 seconds..."
    sleep 15
  fi
  
  ((counter++))
done

if [ $counter -eq $max_attempts ]; then
  echo "Max attempts reached. Exiting."
  exit 1
fi

terraform plan -out tfplan
terraform apply tfplan
