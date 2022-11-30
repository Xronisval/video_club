FROM python:3.7.15-alpine3.16

COPY pypi/createpypi.sh /tmp

RUN apk update && apk add --no-cache git gcc twine

ARG GITHUB_REPO_URL_WITH_CREDENTIALS

RUN git clone "$GITHUB_REPO_URL_WITH_CREDENTIALS" /etc/app_data/

WORKDIR /etc/app_data/pip_packages/pipa_utils_package

RUN python3 setup.py bdist_wheel

WORKDIR /tmp

ARG tokenpypi
RUN sh createpypi.sh ${tokenpypi}
RUN mv .pypirc ~/

WORKDIR /etc/app_data/pip_packages/pipa_utils_package

RUN twine upload --skip-existing dist/*
