class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = set_song
  end

  def new
    @song = Song.new
  end

  def edit
    @song = set_song
    @song.update(song_params(params[:song]))
  end

  def create
  end

  def update
  end

  def delete
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params(*args)
      params.require(:song).permit(title:, released:, release_year:, artist_name:, genre:)
    end
end
