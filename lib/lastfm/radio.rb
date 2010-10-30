module LastFM
  class Radio < APIClass
    allowed_methods :get_playlist, :tune
  end
end