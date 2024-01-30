FROM jupyter/datascience-notebook:python-3.11.6
ENV JUPYTER_ENABLE_LAB=yes

ADD requirements.txt .

RUN pip install -r requirements.txt
RUN python -m spacy download en

CMD start-notebook.sh