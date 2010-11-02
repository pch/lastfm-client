module LastFM
  class Radio < APIClass
    restricted_methods :get_playlist, :tune
  end
end
