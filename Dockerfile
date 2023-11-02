FROM python:3.8.13

COPY ./requirements.txt /tmp/requirements.txt

RUN pip install --user -r /tmp/requirements.txt
RUN pip install --user apache-airflow-providers-postgres==5.3.1

RUN mkdir -p /usr/local/airflow/dags
RUN mkdir -p /usr/local/airflow/custom_lib
WORKDIR /usr/local/airflow
ENV AIRFLOW_HOME=/usr/local/airflow
ENV PATH=/root/.local/bin:$PATH
ENV PYTHONPATH=/usr/local/airflow/custom_lib:$PYTHONPATH

COPY ./airflow.cfg /usr/local/airflow/airflow.cfg
