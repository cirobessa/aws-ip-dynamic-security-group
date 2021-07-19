#!/bin/bash

export AWS_ACCESS_KEY_ID=$ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$SECRET
export AWS_DEFAULT_REGION=us-east-1
export SG=$SG

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

 aws ec2 authorize-security-group-ingress --group-id "${SG}" --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 22, "ToPort": 22, "IpRanges": [{"CidrIp": "'"${NEW_CIDR}"'", "Description": "Rule0"}]}]'

fi

 sleep  600
 done

