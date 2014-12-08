require_relative '../five_shows/last_fm/retrieve_top_artists'
require_relative '../five_shows/song_kick/retrieve_concerts_for'

class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
  end

  def index
    @concerts = FiveShows::SongKick::RetrieveConcertsFor.(
      FiveShows::LastFm::RetrieveTopArtists.(concerts_params[:username])
    )
  end

  private

  def concerts_params
    params.require(:concert).permit(:username)
  end
end
