module LastFM
  class Auth < APIClass
    allowed_methods :get_mobile_session, :get_session, :get_token
  end
end
