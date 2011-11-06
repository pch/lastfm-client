module LastFM
  class Chart < APIClass
    unrestricted_methods :get_hyped_artists, :get_hyped_tracks, :get_loved_tracks,
                         :get_top_artists, :get_top_tags, :get_top_tracks
  end
end
