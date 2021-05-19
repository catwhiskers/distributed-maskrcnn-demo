ARG BASE_IMG=${BASE_IMG}
FROM ${BASE_IMG} 

ENV PATH="/opt/ml/code:${PATH}"
## install cmake 3.17 && opencv
RUN pip install -U 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI' 

WORKDIR /opt/program
RUN cp /changehostname.c /opt/program/
COPY ./src/*.py /opt/program/
#entry point for sagemaker training job 
#ENTRYPOINT ["python", "tv-training-code-sagemaker.py"]

