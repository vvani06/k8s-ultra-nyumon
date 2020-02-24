FROM crystallang/crystal:0.33.0-alpine-build AS dev

RUN mkdir /app
WORKDIR /app

ADD ["./shard.yml", "./shard.lock", "./"]
RUN shards install

# -----------------

FROM dev AS builder

WORKDIR /app
ADD ./ .
RUN crystal build src/main.cr --release --static

# -----------------

FROM busybox

WORKDIR /root
COPY --from=builder /app/main .

CMD ["./main"]
