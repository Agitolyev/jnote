FROM jupyter/datascience-notebook:python-3.9.7
ENV JUPYTER_ENABLE_LAB=yes

CMD start-notebook.sh