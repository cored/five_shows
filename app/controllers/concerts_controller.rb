require_relative '../five_shows/last_fm/retrieve_top_artists'

class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
  end

  def index 
  end

  def create
    @concerts = FiveShows::LastFm::RetrieveTopArtists.(concerts_params[:username])
      
    redirect_to concerts_path
  end

  private 

  def concerts_params 
    params.require(:concert).permit(:username)
  end
end
