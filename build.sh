#!/bin/bash
rm -rf lambda.zip
image_name="clamav-lambda"
docker build -t $image_name .
id=$(docker create $image_name)
docker cp $id:/opt/app/build/lambda.zip ./
docker rm -v $id
# sls deploy --stage dev
