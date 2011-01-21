# Last.fm API Ruby Client

LastFM is a Ruby wrapper for [Last.fm API](http://www.last.fm/api).

## Installation

Add the following line to your Gemfile and run `bundle install`:

    gem 'lastfm-client'

You also need to set up your API key and client name, e.g.:

    LastFM.api_key     = "7234655fd87556209fa94ca6f5e7ad0a8b47f394"
    LastFM.client_name = "My awesome app"

If you're using Rails, you can add the above lines to an initalizer file, e.g. `config/initializers/lastfm.rb`

## Usage examples

    LastFM::Album.get_info(:artist => "Red Hot Chili Peppers", :album => "Mother's Milk")
    LastFM::Artist.get_top_fans(:artist => "Gorillaz")
    LastFM::Geo.get_events(:location => "Warsaw")
    LastFM::User.get_top_albums(:user => "some_user")

### Authentication

For some methods Last.fm requires authentication, which is somewhat similar to oAuth:

    class SessionsController < ApplicationController
      def new
        redirect_to LastFM.auth_url
      end

      def create
        token = params[:token]
        redirect_to root_path and return if !token || token == ""

        api_session = LastFM::Auth.get_session(:token => token, :api_sig => true)
        api_session = api_session["session"]

        user = User.find_by_username(api_session["name"])
        unless user
          # new user
          user = User.create(:username => api_session["name"])
        end

        session[:user_id]     = user.id
        session[:session_key] = api_session["key"]

        redirect_to root_path
      end
    end

