class SongsController < ApplicationController
    def index 
        @songs = Song.all
    end

    def new 
        @song = Song.new
    end

    def show 
        @song = Song.find(params[:id])
        @artist = Artist.find_by(id: @song.artist_id)
        @genre = Genre.find_by(id: @song.genre_id)
    end

    def create 
        @song = Song.create(post_params)
        redirect_to song_path(@song)
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update 
        @song = Song.find(params[:id])
        @song.update(post_params)
        redirect_to song_path(@song)
    end

    private 

    def post_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
