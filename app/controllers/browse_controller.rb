class BrowseController < ApplicationController
  def index
    @songs = Song.all
    @songs = @songs.search_for(params[:filter]) if params[:filter].present?
    @songs = @songs.page(params[:page])
  end

  def folders
    @folder = Folder.where(full_path: params[:path]).first

    @folders = Folder.order('depth asc, path asc')
    @folders = @folders.where('full_path like ?', "#{params[:path]}%").where(depth: @folder.depth+1) if @folder.present?
    @folders = @folders.page(params[:page])
    if @folder
      @songs = @folder.songs.page(params[:song_page])
    end
  end
end
