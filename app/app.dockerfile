FROM python:3.7.15-alpine3.16

# ensures that the python output i.e. the stdout and stderr streams are sent straight to terminal (e.g. your container log)
ENV PYTHONUNBUFFERED=1

RUN apk update && apk add --no-cache git postgresql postgresql-dev gcc python3-dev musl-dev

ARG GITHUB_REPO_URL_WITH_CREDENTIALS
RUN git clone "$GITHUB_REPO_URL_WITH_CREDENTIALS" /etc/app_data/

RUN pip install -r /etc/app_data/video_club/requirements.txt --no-cache-dir

RUN sed -i 's/"HOST": "localhost"/"HOST": "db"/g' /etc/app_data/video_club/video_club/settings.py

RUN sed -i 's/"PORT": ""/"PORT": "5432"/g' /etc/app_data/video_club/video_club/settings.py

WORKDIR /etc/app_data/video_club

CMD python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000
