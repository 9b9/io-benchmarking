FROM alpine

RUN apk update && \
    apk add --no-cache sysbench make

WORKDIR /
COPY Makefile .

CMD [ "make", "test-tmpfs", "test-disk" ]
