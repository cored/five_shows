module FiveShows
  module SongKick 
    class RetrieveConcertsFor
      def self.call(artists)
        new(artists).retrieve
      end

      def initialize(artists)
        @artists = artists
      end

      def retrieve
        concerts = artists.map do |artist| 
          songkick_result = songkick_api.events(artist.name).results.first
          unless songkick_result.nil?
            Venue.new(artist, songkick_result.display_name, songkick_result.uri)
          else 
            NoVenue.new(artist)
          end
        end
        concerts
      end

      Venue = Struct.new(:artist, :name, :uri)

      class NoVenue
        attr_reader :artist, :name, :uri
        def initialize(artist)
          @artist = artist 
          @name = "No Venue" 
          @uri = "#"
        end
      end

      private 

      attr_reader :artists

      def songkick_api 
        @songkick_api ||= Songkickr::Remote.new ENV.fetch('SONGKICK_APIKEY')
      end
    end
  end
end
