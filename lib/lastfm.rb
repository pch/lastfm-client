require "open-uri"
require "uri"
require "json"

module LastFM
  extend self

  autoload :APIClass,    'lastfm/api_class'
  autoload :Album,       'lastfm/album'
  autoload :Artist,      'lastfm/artist'
  autoload :Auth,        'lastfm/auth'
  autoload :Event,       'lastfm/event'
  autoload :Geo,         'lastfm/geo'
  autoload :Group,       'lastfm/group'
  autoload :Library,     'lastfm/library'
  autoload :Playlist,    'lastfm/playlist'
  autoload :Radio,       'lastfm/radio'
  autoload :Tag,         'lastfm/tag'
  autoload :Tasteometer, 'lastfm/tasteometer'
  autoload :Track,       'lastfm/track'
  autoload :User,        'lastfm/user'

  DEFAULT_API_URL = 'http://ws.audioscrobbler.com/2.0/'

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

  def client_name
    @client_name or raise "Client name is not set"
  end

  def client_name=(name)
    @client_name = name
  end

  def send_api_request(method, params)
    raise "Invalid params" unless params.is_a?(Hash)

    params[:method]  = method
    params[:api_key] = self.api_key
    params[:format]  = "json"

    url = api_url + "?" + hash_to_params(params)
    fetch_data(url)
  end

  def fetch_data(url)
    open(url, "User-Agent" => client_name) do |page|
      response = ::JSON.parse(page.read)
      response
    end
  end

  private

    def hash_to_params(hash)
      elements = []
      hash.each { |key, value| elements << "#{key}=#{::URI.encode(value)}" }
      elements.join('&')
    end
end
