FROM ubuntu:20.04

RUN apt update -y && apt install -y \
    libheif-examples inotify-tools
COPY ./run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]