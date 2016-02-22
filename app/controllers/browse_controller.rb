class BrowseController < ApplicationController
  def index
    @songs = Song.all
    @songs = @songs.search_for(params[:filter]) if params[:filter].present?
    @songs = @songs.page(params[:page])
  end

  def folders
    #Folder.all.paginate(params[:page])
  end
end
