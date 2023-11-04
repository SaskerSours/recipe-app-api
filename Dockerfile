FROM python:3.10.13-slim-bookworm

LABEL maintainer="horobets.dmitro@gmail.com"

ENV PYTHONUNBUFFERED 1
COPY requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
    /py/bin/python -m pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ "$DEV" = "true" ]; then  /py/bin/pip install -r /tmp/requirements.dev.txt; fi


RUN useradd -m django-user

ENV PATH="/py/bin:$PATH"

USER django-user
