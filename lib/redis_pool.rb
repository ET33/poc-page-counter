class RedisPool
  def self.redis
    @redis ||= ConnectionPool.new(size: 5, timeout: 5) do
      Redis.new(host: ENV["REDIS_HOST"], port: ENV["REDIS_PORT"])
    end
  end
end
