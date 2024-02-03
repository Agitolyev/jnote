FROM jupyter/datascience-notebook:python-3.11.6
ENV JUPYTER_ENABLE_LAB=yes

WORKDIR /home/jovyan

ADD requirements.txt .
# TODO: add examples dir in image, but github actions have bug with copying dir
# ADD examples ./examples

RUN pip install -r requirements.txt
RUN python -m spacy download en
# TODO: install dependencies in builder image
RUN rm requirements.txt

CMD start-notebook.sh