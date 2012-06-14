class SgNodeMapper
  module Caching

    private

    def cache_and_return(method, *args)
      raise Error, 'You must call cache_and_return with a block' unless block_given?
      cache[method][args] ||= yield
    end

    def cache
      @cache ||= Hash.new { |h, k| h[k] = {} }
    end
  end
end
