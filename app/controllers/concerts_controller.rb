class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
  end

  def index 

  end

  def create

    redirect_to concerts_path
  end
end
