aws ec2 run-instances \
--image-id ami-0629230e074c580f2 \
--security-group-ids sg-4e02e85f \
--instance-type t2.medium \
--key-name skillbridge \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Jenkins}]'

aws ec2 run-instances \
--image-id ami-0629230e074c580f2 \
--security-group-ids sg-4e02e85f \
--instance-type t2.medium \
--key-name skillbridge \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=WebServer}]'
