module FiveShows
  module SongKick 
    module RetrieveConcertsFor
      extend self 

      def call(artists)
        songkick_api = Songkickr::Remote.new ENV.fetch('SONGKICK_APIKEY')
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
    end
  end
end
