FROM python:3.7.3-alpine

# set work directory
WORKDIR /code

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev \
    && apk add sudo \
    && apk add libxml2-dev libxslt-dev \
    && apk add --no-cache gcc libffi-dev g++ build-base linux-headers postgresql-contrib pcre-dev bash alpine-sdk jpeg-dev zlib-dev \
    && apk del build-deps

# install dependencies
RUN pip install --upgrade pip
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# copy project
COPY . /code/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# collect static files
RUN python manage.py collectstatic --noinput

# run gunicorn
CMD gunicorn tattoo.wsgi:application --bind 0.0.0.0:$PORT

