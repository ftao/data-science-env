FROM python:3.4
MAINTAINER Tao Fei <filia.tao@gmail.com>

ENV PIP_INDEX_URL "https://pypi.python.org/simple/"

WORKDIR /workspace
COPY requirements.txt /workspace
RUN pip install -i $PIP_INDEX_URL --no-cache-dir -r requirements.txt && \
    pip install -i $PIP_INDEX_URL --no-cache-dir feather-format

# Install XGBoost library
RUN git clone --recursive https://github.com/dmlc/xgboost && \
    cd xgboost && \
    make -j4 && \
    cd python-package; python setup.py install
RUN rm -rf xgboost
