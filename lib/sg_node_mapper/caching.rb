class SgNodeMapper
  module Caching
    def cache_and_return(method, *args, &block)
      cache[key_for(method, *args)] ||= block.call
    end

    def cache
      @cache ||= {}
    end

    def key_for(method, *args)
      [method, *args].to_s
    end
  end
end
