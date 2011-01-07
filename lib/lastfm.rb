require "open-uri"
require "uri"
require "json"
require 'digest/md5'

module LastFM
  extend self

  autoload :APIClass,    'lastfm/api_class'
  autoload :Album,       'lastfm/api_classes/album'
  autoload :Artist,      'lastfm/api_classes/artist'
  autoload :Auth,        'lastfm/api_classes/auth'
  autoload :Event,       'lastfm/api_classes/event'
  autoload :Geo,         'lastfm/api_classes/geo'
  autoload :Group,       'lastfm/api_classes/group'
  autoload :Library,     'lastfm/api_classes/library'
  autoload :Playlist,    'lastfm/api_classes/playlist'
  autoload :Radio,       'lastfm/api_classes/radio'
  autoload :Tag,         'lastfm/api_classes/tag'
  autoload :Tasteometer, 'lastfm/api_classes/tasteometer'
  autoload :Track,       'lastfm/api_classes/track'
  autoload :User,        'lastfm/api_classes/user'
  autoload :Venue,       'lastfm/api_classes/venue'

  DEFAULT_API_URL  = 'http://ws.audioscrobbler.com/2.0/'
  DEFAULT_AUTH_URL = 'http://www.last.fm/api/auth/'

  def api_url
    @api_url || DEFAULT_API_URL
  end

  def api_url=(url)
    @api_url = url
  end

  def api_key
    @api_key or raise "API Key is not set"
  end

  def api_key=(key)
    @api_key = key
  end

  def secret
    @secret or raise "Secret is not set"
  end

  def secret=(secret)
    @secret = secret
  end

  def client_name
    @client_name or raise "Client name is not set"
  end

  def client_name=(name)
    @client_name = name
  end

  def auth_url
    (@auth_url || DEFAULT_AUTH_URL) + "?api_key=#{self.api_key}"
  end

  def auth_url=(url)
    @auth_url = url
  end

  def send_api_request(method, params, request_method = :get)
    raise "Invalid params" unless params.is_a?(Hash)

    params[:method]  = method
    params[:api_key] = self.api_key

    if params[:api_sig] == true
      params.delete(:api_sig)
      params[:api_sig] = generate_signature(params)
    end

    params[:format] = "json"

    if request_method == :post
      post_data(self.api_url, params)
    else
      fetch_data(self.api_url + "?" + hash_to_params(params))
    end
  end

  def fetch_data(url)
    open(url, "User-Agent" => client_name) do |page|
      ::JSON.parse(page.read)
    end
  end

  def post_data(url, params)
    url = URI.parse(url)
    req = Net::HTTP::Post.new(url.path)
    req.set_form_data(params)

    res = Net::HTTP.new(url.host, url.port).start { |http| http.request(req) }

    case res
    when Net::HTTPSuccess, Net::HTTPRedirection
      return ::JSON.parse(res.body)
    when Net::HTTPClientError
      raise Messy::InvalidData, res.body if res.code == "422" # unprocessable entity
    end

    raise LastFM::APIException, res.error!
  end

  def generate_signature(params)
    params    = params.sort_by { |k,v| k.to_s }
    signature = params.map { |param| "#{param[0].to_s}#{::URI.encode(param[1].to_s)}" }.join('')

    Digest::MD5.hexdigest(signature + self.secret)
  end

  def hash_to_params(hash)
    hash.map { |key, value| "#{key}=#{::URI.encode(value)}" }.join('&')
  end
end
