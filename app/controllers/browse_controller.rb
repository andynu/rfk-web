class BrowseController < ApplicationController
  def index
    @folder = Folder.where(full_path: params[:path]).first
    @folder ||= Folder.order('songs_count desc, depth desc').limit(1).first
    #logger.info @folder.inspect
    depth = @folder.try(:depth) || 0
    path = @folder.try(:full_path) || ''

    @path_parts = []
    pparts = path.split(/\//)
    pparts.shift
    path_agg = ""
    pparts.each_with_index do |ppath, i|
      path_agg +=  "/" + ppath
      @path_parts << [ppath,path_agg]
    end

    @folders = Folder.order('depth asc, path asc')\
              .where('full_path like ?', "#{path}%")\
              .where(depth: depth+1)\
              .page(params[:folder_page] || 0).per(100)

    @songs = @folder.songs.page(params[:song_page]) if @folder.present?
  end
end
