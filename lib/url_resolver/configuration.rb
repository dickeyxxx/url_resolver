module UrlResolver
  class Configuration
    attr_accessor :cache_failures
    attr_reader :cache, :url_cache

    def initialize
      @cache_failures = true
      @cache = nil
      @url_cache = Cache.new(@cache)
    end
    
    def cache=(cache)
      @cache = cache
      @url_cache = Cache.new(@cache)
    end
  end
  
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
