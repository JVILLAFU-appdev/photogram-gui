Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:path_name", {:controller => "users", :action => "show"})

  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:path_photo", {:controller => "photos", :action => "photo_info"})
  get("/delete_photo/:path_photo", {:controller => "photos", :action => "photo_delete"})

end
