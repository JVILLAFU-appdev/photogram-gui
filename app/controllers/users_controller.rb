class UsersController < ApplicationController
  
  def index
    @list_of_users = User.all
    render({ :template => "user_templates/index.html.erb"})
  end

  def user_info

    user_name = params.fetch("name")
    @user = User.where({:username => user_name }).first

    render({ :template => "user_templates/user_info.html.erb"})
  end

end
