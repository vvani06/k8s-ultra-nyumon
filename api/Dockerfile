FROM crystallang/crystal:0.33.0-alpine-build as builder

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN shards install
RUN crystal build --release src/main.cr

# -----------------

FROM crystallang/crystal:0.33.0-alpine

WORKDIR /root/
COPY --from=builder /app/main .

CMD ["./main"]
