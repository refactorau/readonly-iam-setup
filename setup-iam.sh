#!/bin/sh
aws iam create-group --group-name Read_Only_Group
aws iam create-user --user-name Westcon_AWS_Finance
aws iam add-user-to-group --user-name  Westcon_AWS_Finance --group-name Read_Only_Group
aws iam put-user-policy --group-name Read_Only_Group --policy-name ReadOnlyAccess-ReadOnlyGroup --policy-document policy.json
aws iam create-access-key --user-name Westcon_AWS_Finance
