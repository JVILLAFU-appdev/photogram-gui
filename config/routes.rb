Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:name", {:controller => "users", :action => "user_info"})

  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:photo", {:controller => "photos", :action => "photo_info"})

end
