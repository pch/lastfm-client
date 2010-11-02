module LastFM
  class Auth < APIClass
    unrestricted_methods :get_token
    restricted_methods   :get_mobile_session, :get_session
  end
end
