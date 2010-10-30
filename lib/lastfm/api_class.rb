module LastFM
  class APIClass
    def method_missing(method, params = {})
      raise RuntimeError,  "Undefined method #{method}" unless self.class.allowed_methods.include?(method)
      raise ArgumentError, "Params should be a hash"    unless params.is_a?(Hash)

      api_method  = self.class.to_s.split("::").last + "." # LastFM::Album => Album
      api_method += method.to_s.tr('_', '')                # get_info => getinfo

      LastFM.send_api_request(api_method, params)
    end

    def self.allowed_methods(*args)
      @allowed_methods ||= []
      @allowed_methods   = args if args.length > 0
      @allowed_methods
    end
  end
end
