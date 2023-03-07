class UsersController < ApplicationController
  
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})

    render({ :template => "user_templates/index.html.erb"})
  end

  def show

    user_name = params.fetch("name")
    @user = User.where({:username => user_name }).first

    render({ :template => "user_templates/show.html.erb"})
  end

end
