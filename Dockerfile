FROM alpine:3.6

RUN mkdir -p /data/in/tables /data/out/tables
WORKDIR /code
COPY . /code/

# Run the application
CMD /bin/sh /code/main.sh
