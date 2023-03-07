class PhotosController < ApplicationController
  
  def index
    render({ :template => "photo_templates/index.html.erb"})
  end

  def photo_info

    @photo_id = params.fetch("photo")

    render({ :template => "photo_templates/photo_info.html.erb"})
  end

end
