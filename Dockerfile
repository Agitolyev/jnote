FROM jupyter/datascience-notebook:python-3.11.6
ENV JUPYTER_ENABLE_LAB=yes

WORKDIR /home/jovyan

USER root

RUN /bin/bash -o pipefail -c

RUN apt-get update \ 
    && apt-get install build-essential python3-dev libcairo2-dev libpango1.0-dev ffmpeg texlive texlive-latex-extra -y \
    && apt-get clean

USER 1000

RUN /bin/bash -o pipefail -c

ADD requirements.txt .
# TODO: add examples dir in image, but github actions have bug with copying dir
# ADD examples ./examples

RUN pip install -r requirements.txt
RUN python -m spacy download en
# TODO: install dependencies in builder image
RUN rm requirements.txt

CMD start-notebook.sh