FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# Install dependencies
RUN yum update -y && \
 yum install -y curl awscli
 

# Copy execution script
COPY  ./roda-cmd.sh /roda-cmd.sh
RUN chmod 755 /roda-cmd.sh

 
#RUN SCRIPT
CMD /roda-cmd.sh 
