class BrowseController < ApplicationController
  def index
    @folder = Folder.where(full_path: params[:path]).first
    @folder ||= Folder.order('depth asc').limit(1).first
    logger.info @folder.inspect
    depth = @folder.depth || 0
    path = @folder.full_path || ''

    @folders = Folder.order('depth asc, path asc')\
              .where('full_path like ?', "#{path}%")\
              .where(depth: depth+1)\
              .page(params[:folder_page] || 0)

    @songs = @folder.songs.page(params[:song_page])
  end
end
