# Last.fm API Ruby Client

LastFM is a Ruby wrapper for [Last.fm API](http://www.last.fm/api).

### Installation

Add the following line to your Gemfile and run `bundle install`:

    gem 'lastfm', :git => 'http://github.com/pch/lastfm.git'

You also need to set up your API key and client name, e.g.:

    LastFM.api_key     = "7234655fd87556209fa94ca6f5e7ad0a8b47f394"
    LastFM.client_name = "My awesome app"

If you're using Rails, you can add the above lines to an initalizer file, e.g. `config/initializers/lastfm.rb`

### Usage examples

    LastFM::Album.get_info(:artist => "Red Hot Chili Peppers", :album => "Mother's Milk")
    LastFM::Artist.get_top_fans(:artist => "Gorillaz")
    LastFM::Geo.get_events(:location => "Warsaw")
    LastFM::User.get_top_albums(:user => "some_user")
