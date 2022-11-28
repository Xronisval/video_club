FROM python:3.7.15-alpine3.16

COPY pypi/createpypi.sh /tmp

RUN apk update && apk add --no-cache gcc twine

WORKDIR /usr/local/lib/python3.7/site-packages/pkg_resources/tests/data/my-test-package-source/

RUN sed -i 's/name="my-test-package",/name="DevOpsdeustest2022",/g' /usr/local/lib/python3.7/site-packages/pkg_resources/tests/data/my-test-package-source/setup.py

RUN python3 setup.py bdist_wheel

WORKDIR /tmp

ARG tokenpypi
RUN sh createpypi.sh ${tokenpypi}
RUN mv .pypirc ~/

WORKDIR /usr/local/lib/python3.7/site-packages/pkg_resources/tests/data/my-test-package-source/

RUN twine upload dist/*
