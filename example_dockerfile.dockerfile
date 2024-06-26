FROM python:3.9-slim

RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
RUN pip install -r requirements.txt
ADD . /app/

CMD [ "gunicorn", "--workers=5", "--threads=1", "--timeout=600", "-b 0.0.0.0:8000", "src.app:server"]