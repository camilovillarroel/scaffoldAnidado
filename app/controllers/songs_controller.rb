class SongsController < ApplicationController
    def create 
        song = Song.new(song_params)
        song.playlist = Playlist.find(params[:playlist_id])
        song.save
        redirect_to playlist_path(song.playlist), notice: 'La cancion se ha creado con exito'
    end
    def destroy
        song = Song.find(params[:id])
        song.destroy
        redirect_to playlist_path(song.playlist), notice: 'La cancion ha sido eliminada con exito'
    end
    private
    def song_params
        params.require(:song).permit(:name, :artist)
    end
end
