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

  def photo_delete

    photo_id = params.fetch("path_photo")
    matching_photo = Photo.where({:id => photo_id})
    the_photo = matching_photo.first
    the_photo.destroy

    redirect_to("/photos")
  end

  def photo_insert

    #Parameters: {"input_image"=>"https://groups.chicagobooth.edu/upload/booth/2021/image_upload_2203545_EVC_Club_Logo_White_106211542.png", "input_caption"=>"fff", "input_owner_id"=>"117"}

   
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")
    
    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def photo_update

    foto_id = params.fetch("path_photo")

    #Parameters: {"input_image"=>"https://robohash.org/dolorehicincidunt.png?size=300x300&set=set1", "input_caption"=>"Once you’ve accepted your flaws, no one can use them against you.", "path_photo"=>"955"}

    update_image = params.fetch("input_image")
    update_caption = params.fetch("input_caption")

    update_photo = Photo.where({:id => foto_id}).first
    update_photo.image = update_image
    update_photo.caption = update_caption
    update_photo.save

    redirect_to("/photos/" + foto_id.to_s)
  end
  
end
