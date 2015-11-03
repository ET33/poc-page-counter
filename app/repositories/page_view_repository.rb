class PageViewRepository
  def redis(options = {}, &block)
    @redis ||= RedisPool.redis.with(options, &block)
  end

  def increment_news(news)
    redis do |conn|
      conn.zincrby(:news_counter, 1, news.id)
    end

  rescue => e
    logger.tagged("PAGEVIEW") { logger.error("Error increment pageview: #{e.message} . Trace: #{e.backtrace.join(" | ")}") }
  end

  def most_read_ids
    redis do |conn|
      conn.zrevrangebyscore(:news_counter, "+inf", "-inf", limit: [0, 5]) || []
    end
  rescue => e
    logger.tagged("PAGEVIEW") { logger.error("Error while retrieving most read news: #{e.message} . Trace: #{e.backtrace.join(" | ")}") }
  end

  def logger
    @logger ||= ActiveSupport::TaggedLogging.new(Rails.logger)
  end
end
