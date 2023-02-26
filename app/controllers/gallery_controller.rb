class GalleryController < ApplicationController
  def index
    @gallery = Store.all
  end

  def search
    keyword = '%' + params[:search] + '%'
    @gallery = Store.find_by_sql ["Select * from stores WHERE name like ? or category like ? or description like ?", keyword,keyword,keyword]
  end


end
