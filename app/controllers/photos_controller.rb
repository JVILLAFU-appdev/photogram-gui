class PhotosController < ApplicationController
  
  def index

    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})

    render({ :template => "photo_templates/index.html.erb"})
  end

  def photo_info

    @photo_id = params.fetch("path_photo")
    @selected_photo = Photo.where({:id => @photo_id}).first

    @photo_comments = Comment.where({:photo_id => @photo_id})

    render({ :template => "photo_templates/show.html.erb"})
  end

end
