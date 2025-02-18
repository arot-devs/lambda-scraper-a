#!/bin/bash
for arn in $(
  aws iam list-policies \
    --query 'Policies[?starts_with(PolicyName, `proxy-`) == `true`].Arn' \
    --output text
)
do
  echo "Deleting $arn..."
  aws iam delete-policy --policy-arn "$arn"
done
