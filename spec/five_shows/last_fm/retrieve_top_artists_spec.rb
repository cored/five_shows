require 'vcr_helper'
require 'lastfm'
require_relative '../../../app/five_shows/last_fm/retrieve_top_artists' 

describe FiveShows::LastFm::RetrieveTopArtists do 
  let(:username) { 'cored' } 

  describe '#call' do 
    it 'returns the five top artists for a given user' do 
      VCR.use_cassette('list-of-artists') do 
        expect(
          FiveShows::LastFm::RetrieveTopArtists.(username).map(&:name)
        ).to eql ["Wolfgang Amadeus Mozart", "はっぴいえんど", "Huey Lewis & The News", "Corduroy", "Fink"]
      end
    end
  end
end
