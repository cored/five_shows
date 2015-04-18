require 'vcr_helper'
require_relative '../../../app/five_shows/last_fm/retrieve_top_artists'
require_relative '../../../app/five_shows/song_kick/retrieve_concerts_for'

module ListConcertsSteps
  step "Last fm user :username" do |username| 
    VCR.use_cassette('list-of-artists') do 
      @artists = FiveShows::LastFm::RetrieveTopArtists.(username)
    end
  end

  step "I view the list of concerts" do 
    VCR.use_cassette('songkick-events-for-artists')  do 
      @concerts = FiveShows::SongKick::RetrieveConcertsFor.(@artists)
    end
  end

  step "I want to be able to see :artist" do |artist|
    expect(@concerts.map { |concert| concert.artist.name }).
      to include 'Huey Lewis & The News'
  end
end
 
RSpec.configure { |c| c.include ListConcertsSteps }
