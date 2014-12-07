module FiveShows
  module LastFm
    module RetrieveTopArtists
      extend self

      def call(username)
        last_fm = Lastfm.new(ENV.fetch('LASTFM_API_KEY'),
                             ENV.fetch('LASTFM_SECRET_KEY'))
        last_fm.user.get_top_artists(user: username).map do |artist| 
          Artist.new(artist.fetch("name"),
                     artist.fetch("playcount"),
                     artist.fetch("url"))
        end.take(5)
      rescue Lastfm::ApiError
        []
      end

      Artist = Struct.new(:name, :playcount, :url)
    end
  end
end
