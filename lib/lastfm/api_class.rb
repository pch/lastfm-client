module LastFM
  class APIClass
    def self.method_missing(method, params = {})
      raise RuntimeError,  "Undefined method #{method}" unless (unrestricted_methods | restricted_methods).include?(method)
      raise ArgumentError, "Params should be a hash"    unless params.is_a?(Hash)

      api_method  = self.to_s.split("::").last + "." # LastFM::Album => Album
      api_method += method.to_s.tr('_', '')          # get_info => getinfo

      params[:api_sig] = true if restricted_methods.include?(method)
      LastFM.send_api_request(api_method.downcase, params)
    end

    def self.unrestricted_methods(*args)
      @unrestricted_methods ||= []
      @unrestricted_methods   = args if args.length > 0
      @unrestricted_methods
    end

    def self.restricted_methods(*args)
      @restricted_methods ||= []
      @restricted_methods   = args if args.length > 0
      @restricted_methods
    end
  end
end
