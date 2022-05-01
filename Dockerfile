FROM jupyter/datascience-notebook:python-3.9.7
ENV JUPYTER_ENABLE_LAB=yes

ADD nlp.yaml .

RUN conda env update --file ~/nlp.yaml

CMD start-notebook.sh