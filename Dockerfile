# MLFlow server's dockerfile
FROM python:3.8.2-slim

ENV AWS_ACCESS_KEY_ID='minioadmin'
ENV AWS_SECRET_ACCESS_KEY='verysecretpassword'
ENV MLFLOW_S3_ENDPOINT_URL='http://172.18.121.247:9000'

RUN pip install --upgrade pip
RUN apt-get update -y && apt-get install -y libpq-dev gcc libblas-dev liblapack-dev gfortran g++
RUN pip install mlflow boto3 psycopg2

ENTRYPOINT ["mlflow", "server", \
	"-h", "0.0.0.0", \
	"--artifacts-destination", "s3://ml-bucket/mlartifacts", \
	"--serve-artifacts", "--backend-store-uri", "postgresql://jeremie:postgressecret@172.18.57.152:5432/mlflow_backend"]

