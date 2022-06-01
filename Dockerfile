# MLFlow server's dockerfile
FROM python:3.8.2-slim

RUN pip install --upgrade pip
RUN apt-get update -y && apt-get install -y libpq-dev gcc libblas-dev liblapack-dev gfortran
RUN pip install numpy
# RUN apt-get update -y && apt-get install -y libpq-dev gcc libblas-dev liblapack-dev gfortran
# RUN pip install mlflow boto3 
# RUN pip install psycopg2

ENTRYPOINT ["mlflow", "server", \
	"-h", "0.0.0.0", \
	"--artifacts-destination", "s3://ml-bucket/mlartifacts", \
	"--serve-artifacts"]

