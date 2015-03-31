module FiveShows
  module LastFm
    class RetrieveTopArtists
      def self.call(username)
        new(username).retrieve
      end

      def initialize(username)
        @username = username
      end

      def retrieve
        last_fm.user.get_top_artists(user: username).map do |artist| 
          Artist.new(artist.fetch("name"),
                     artist.fetch("playcount"),
                     artist.fetch("url"))
        end.take(5)
      rescue Lastfm::ApiError
        []
      end

      Artist = Struct.new(:name, :playcount, :url)

      private 

      def last_fm
        @last_fm ||= Lastfm.new(ENV.fetch('LASTFM_API_KEY'), 
                                ENV.fetch('LASTFM_SECRET_KEY'))
      end

      attr_reader :username
    end
  end
end
