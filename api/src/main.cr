require "kemal"
require "redis"

REDIS_HOST = ENV["REDIS_HOST"]
REDIS_PORT = ENV["REDIS_PORT"].to_i

redis = Redis.new(host: REDIS_HOST, port: REDIS_PORT)
redis.set("count", 0)
redis.close

get "/" do
  redis = Redis.new(host: REDIS_HOST, port: REDIS_PORT)
  count = redis.incr("count")
  redis.close

  "Hello World! ##{count}"
end

Kemal.run
