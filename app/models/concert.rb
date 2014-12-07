class Concert < ActiveRecord::Base

  def self.save_concert(artist_name, concert_name, concert_uri) 
    create(artist: artist_name, name: concert_name, uri: concert_uri)
  end
end
