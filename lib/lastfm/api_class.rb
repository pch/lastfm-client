module LastFM
  class APIClass

    def self.unrestricted_methods(*args)
      args.each do |method|
        define_api_method(method) do |params|
          raise ArgumentError, "Params should be a hash" unless params.is_a?(Hash)
          send_request(method, params)
        end
      end
    end

    def self.restricted_methods(*args, &block)
      if block_given?
        yield
      else
        read(*args)
      end
    end

    def self.read(*args)
      args.each do |method|
        define_api_method(method) do |params|
          restricted_method(method, params)
        end
      end
    end

    def self.write(*args)
      args.each do |method|
        define_api_method(method) do |params|
          restricted_method(method, params, :post)
        end
      end
    end

    def self.restricted_method(method, params, request_method = :get)
      raise ArgumentError, "Params should be a hash" unless params.is_a?(Hash)

      params[:api_sig] = true
      send_request(method, params, request_method)
    end

    def self.send_request(method, params, request_method = :get)
      api_method  = self.to_s.split("::").last + "." # LastFM::Album => Album
      api_method += method.to_s.tr('_', '')          # get_info => getinfo

      LastFM.send_api_request(api_method.downcase, params, request_method)
    end

    def self.define_api_method(method, &block)
      (class << self; self; end).instance_eval do
        define_method(method, &block)
      end
    end
  end
end
