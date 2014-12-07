require 'rails_helper' 

describe Concert do 

  describe '#save_concert' do 
    let(:artist) { 'artist' } 
    let(:concert_name) { 'concert_name' } 
    let(:concert_uri) { '#' }

    it 'save a new concert' do 
      expect { 
        Concert.save_concert(artist, concert_name, concert_uri)
      }.to change(Concert, :count).by 1
    end
  end

end
