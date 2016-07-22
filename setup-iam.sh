#!/bin/bash

display_usage() {
	echo -e "\nUsage:\n$0 [aws-profile-name] \n"
}

if [[ ( $# == "--help") ||  $# == "-h" ]]
then
  display_usage
  exit 0
fi

if [  $# -ne 1 ]
then
  display_usage
  exit 1
fi

AWS_PROFILE=$1

aws iam create-group --profile $AWS_PROFILE --group-name Read_Only_Group
aws iam create-user --profile $AWS_PROFILE --user-name Westcon_AWS_Finance
aws iam add-user-to-group --profile $AWS_PROFILE --user-name  Westcon_AWS_Finance --group-name Read_Only_Group
aws iam put-group-policy --profile $AWS_PROFILE --group-name Read_Only_Group --policy-name ReadOnlyAccess-ReadOnlyGroup --policy-document file://policy.json
aws iam create-access-key --profile $AWS_PROFILE --user-name Westcon_AWS_Finance
