#!/bin/bash

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=$AWS_ACTION_REGION
export SG=$SECURITY_GROUP


while true
 do
 date 


# need my current ip
MY_IP=$(curl --silent https://checkip.amazonaws.com)
echo "Your IP is ${MY_IP}"o


NEW_CIDR="${MY_IP}"/32


aws ec2 describe-security-groups  | grep -i $NEW_CIDR
if [ $? -gt 0  ]
then

 aws ec2 authorize-security-group-ingress --group-id "${SG}" --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 5432, "ToPort": 5432, "IpRanges": [{"CidrIp": "'"${NEW_CIDR}"'", "Description": "Rule0"}]}]'

fi

 sleep  600
 done

