FROM python:3.10.4

RUN apt-get update && \
    apt-get upgrade && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tests

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    rm -f requirements.txt

USER nobody
CMD [ "pytest", "-p", "no:cacheprovider", "-v" ]
