class UsersController < ApplicationController
  
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})

    render({ :template => "user_templates/index.html.erb"})
  end

  def show

    # Parameters: {"name"=>"pele"}
    url_username = params.fetch("name")
    matching_usernames = User.where({:username => url_username })
    @the_user = matching_usernames.first
    
    #if the_user == nil
    # redirect_to("/")
    #else  

    render({ :template => "user_templates/show.html.erb"})
  end

end
