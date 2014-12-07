module FiveShows
  module SongKick 
    module RetrieveConcertsFor
      extend self 

      def call(artists)
        songkick_api = Songkickr::Remote.new ENV.fetch('SONGKICK_APIKEY')
        concerts = artists.map do |artist| 
          songkick_result = songkick_api.events(artist.name).results.first
          Venue.new(artist, songkick_result.display_name, songkick_result.uri)
        end
        concerts
      end

      Venue = Struct.new(:artist, :name, :uri)
    end
  end
end
