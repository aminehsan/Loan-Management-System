FROM python:alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app
COPY . .

RUN apk update \
&& apk add --no-cache \
  build-base \
  libffi-dev \
  musl-dev \
&& rm -rf /var/cache/apk/* \
&& pip install --upgrade pip \
&& pip install --no-cache-dir -r requirements.txt \
&& chmod +x ./run.sh

ENTRYPOINT ["sh", "./run.sh"]
