require "kemal"
require "redis"

REDIS_HOST = ENV["REDIS_HOST"]
REDIS_PORT = ENV["REDIS_PORT"].to_i

redis = Redis.new(host: REDIS_HOST, port: REDIS_PORT)
at_exit { redis.close }

get "/" do
  count = redis.incr("count")
  "Hello World! ##{count}"
end

Kemal.run
