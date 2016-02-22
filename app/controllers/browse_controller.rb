class BrowseController < ApplicationController
  def index
    @songs = Song.all
    @songs = @songs.search_for(params[:filter]) if params[:filter].present?
    @songs = @songs.page(params[:page])
  end

  def folders
    @folders = Folder.all.page(params[:page])
    @folder = Folder.where(full_path: params[:path]).first
    @songs = @folder.songs.page(params[:song_page])
  end
end
