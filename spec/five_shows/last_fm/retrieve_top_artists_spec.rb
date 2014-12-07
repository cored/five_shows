require 'vcr_helper'
require 'lastfm'
require_relative '../../../app/five_shows/last_fm/retrieve_top_artists' 

describe FiveShows::LastFm::RetrieveTopArtists do 
  describe '#call' do 
    let(:username) { 'cored' } 

    context 'when the user exists in Last.FM' do 
      it 'returns the five top artists for a given user' do 
        VCR.use_cassette('list-of-artists') do 
          expect(
            FiveShows::LastFm::RetrieveTopArtists.(username).map(&:name)
          ).to eql ["Wolfgang Amadeus Mozart", "はっぴいえんど", "Huey Lewis & The News", "Corduroy", "Fink"]
        end
      end
    end

    context "when the user doesn't exists in Last.FM" do 
      let(:username) { 'dump-anonymous' } 
      it 'returns an empty array' do 
        VCR.use_cassette('no-last-fm-user') do 
          expect(
            FiveShows::LastFm::RetrieveTopArtists.(username)
          ).to eql []
        end
      end
    end
  end
end
