FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y gnupg2 && \
    apt-get install -y wget && \
    apt-get install -y unzip && \
    apt-get install -y zip && \
    wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip && \
    unzip ./terraform_0.12.7_linux_amd64.zip -d /usr/local/bin/ && \
    apt install -y docker.io && \
    apt-get -y install python3 && \
    apt install -y python3-pip && \
    pip3 install awscli --upgrade && \
    mkdir /build && \
    mkdir /build/iac && \
    mkdir /build/app

# terraform arguments
ARG REMOTE_STATE_BUCKET
ARG REMOTE_STATE_FILE
ARG REMOTE_STATE_AWS_REGION

# aws arguments
ARG AWS_REGION
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

# tags arguments
ARG ENV
ARG PRODUCT
ARG ROLE
ARG CREATED_BY
ARG OWNER
ARG RELEASE
ARG PROJECT

# sqs arguments
ARG FIFO
ARG DELAY_SECONDS
ARG MAX_MESSAGE_SIZE
ARG MESSAGE_RETENTION_SECONDS
ARG RECEIVE_WAIT_TIME_SECONDS

# terraform envs
ENV REMOTE_STATE_BUCKET $REMOTE_STATE_BUCKET
ENV REMOTE_STATE_FILE $REMOTE_STATE_FILE
ENV REMOTE_STATE_AWS_REGION $REMOTE_STATE_AWS_REGION

# aws envs
ENV AWS_REGION $AWS_REGION
ENV AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY

# tags envs
ENV ENV $ENV
ENV PRODUCT $PRODUCT
ENV ROLE $ROLE
ENV CREATED_BY $CREATED_BY
ENV OWNER $OWNER
ENV RELEASE $RELEASE
ENV PROJECT $PROJECT

# sqs envs
ENV FIFO $FIFO
ENV DELAY_SECONDS $DELAY_SECONDS
ENV MAX_MESSAGE_SIZE $MAX_MESSAGE_SIZE
ENV MESSAGE_RETENTION_SECONDS $MESSAGE_RETENTION_SECONDS
ENV RECEIVE_WAIT_TIME_SECONDS $RECEIVE_WAIT_TIME_SECONDS

COPY . /build/iac

WORKDIR /build/iac

RUN chmod +x deploy.sh

CMD printenv && \
    ls -la /build/app && \
    ./deploy.sh