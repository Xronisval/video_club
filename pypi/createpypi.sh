#!/bin/sh

touch ~/ .pypirc
echo "[pypi]" >> .pypirc
echo "username = __token__" >> .pypirc
echo "password = $1"  >> .pypirc
