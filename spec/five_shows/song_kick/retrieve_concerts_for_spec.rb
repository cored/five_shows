require 'vcr_helper'
require 'songkickr'
require 'spec_helper'
require_relative '../../../app/five_shows/song_kick/retrieve_concerts_for'

describe FiveShows::SongKick::RetrieveConcertsFor do
  describe '#call' do
    let(:artists) do
      ['The Used', 'Ed Sheeran', 'La Roux', 'The Cat Empire', 'Kaiser Chiefs']
    end

    it 'returns a list of urls for concerts' do
      VCR.use_cassette('songkick-events') do 
        expect(
          FiveShows::SongKick::RetrieveConcertsFor.(artists).map(&:uri)
        ).to eql(["http://www.songkick.com/concerts/22276903-used-at-mo-club?utm_source=31538&utm_medium=partner", 
                  "http://www.songkick.com/festivals/1184053/id/22197803-capitals-jingle-bell-ball-2014?utm_source=31538&utm_medium=partner", 
                  "http://www.songkick.com/concerts/20706858-la-roux-at-gibson?utm_source=31538&utm_medium=partner", 
                  "http://www.songkick.com/festivals/122786/id/22047523-woodford-folk-festival-2014?utm_source=31538&utm_medium=partner", 
                  "http://www.songkick.com/concerts/20968878-foo-fighters-at-cape-town-stadium?utm_source=31538&utm_medium=partner"])
      end
    end
  end
end
