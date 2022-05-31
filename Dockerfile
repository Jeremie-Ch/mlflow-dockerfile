# MLFlow server's dockerfile
FROM python:3.8.2-slim

RUN apt-get update -y && apt-get install -y libpq-dev gcc libblas-dev liblapack-dev
RUN pip install mlflow boto3 psycopg2

ENTRYPOINT ["mlflow", "server", \
	"-h", "0.0.0.0", \
	"--artifacts-destination", "s3://ml-bucket/mlartifacts", \
	"--serve-artifacts"]

