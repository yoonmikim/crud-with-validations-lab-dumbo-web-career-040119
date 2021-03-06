class SongsController < ApplicationController
  before_action :get_song, only: [:show, :edit, :update]
  
  def index 
    @songs = Song.all 
  end
  
  def new 
    @song = Song.new
  end
  
  def create 
    @song = Song.new(song_params)
      if @song.valid?
        @song.save 
        redirect_to @song
      else 
        render :new
      end
  end
  
  def update 
    if @song.update(song_params)
      redirect_to @song
    else 
      render :edit
    end
  end
  
  def destroy
    Song.destroy(parmas[:id])
  end
  
  private 
  
  def get_song
    @song = Song.find(params[:id])
  end
  
  def song_params 
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
  
end
