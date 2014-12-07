require_relative '../five_shows/last_fm/retrieve_top_artists'
require_relative '../five_shows/song_kick/retrieve_concerts_for'

class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
  end

  def index
    @concerts = Concert.all
  end

  def create
    FiveShows::SongKick::RetrieveConcertsFor.(
      FiveShows::LastFm::RetrieveTopArtists.(concerts_params[:username])
    ).map do |concert|
      Concert.save_concert(concert.artist.name, concert.name, concert.uri)
    end

    redirect_to concerts_path
  end

  private

  def concerts_params
    params.require(:concert).permit(:username)
  end
end
