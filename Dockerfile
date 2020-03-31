FROM python:3.8-slim-buster@sha256:894d220863891b9b628da9c19d305ce88464c564c470561507a512ce5645b94a
RUN apt update && apt install curl make git libopenblas-base -y
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
ENV SHELL /bin/bash -l

ENV POETRY_CACHE /work/.cache/poetry
ENV PIP_CACHE_DIR /work/.cache/pip
ENV JUPYTER_RUNTIME_DIR /work/.cache/jupyter/runtime
ENV JUPYTER_CONFIG_DIR /work/.cache/jupyter/config

RUN $HOME/.poetry/bin/poetry config virtualenvs.path $POETRY_CACHE

ENV PATH /root/.poetry/bin:/bin:/usr/local/bin:/usr/bin

CMD ["bash", "-l"]
