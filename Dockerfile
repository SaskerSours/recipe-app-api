FROM python:3.10

LABEL maintainer="horobets.dmitro@gmail.com"

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /app/requirements.txt
COPY ./requirements.dev.txt /app/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
    python -m pip install --upgrade pip && \
    pip install -r requirements.txt && \
    if [ "$DEV" = "true" ]; then pip install -r requirements.dev.txt; fi


RUN useradd -m django-user

ENV PATH="/py/bin:$PATH"

USER django-user
