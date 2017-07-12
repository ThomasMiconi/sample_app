class UsersController < ApplicationController

    def show
        @myuser = User.find(params[:id])
    end

    # Note that "new" is just the signup page
    def new
        @myuser = User.new  # Create a new user in memory, whose params will be filled by the form
    end

    # "create" is called by the signup page form to actually create a user
    def create 
        @myuser = User.new(params[:user]) # 'user' is a dictionary created by the signup form and containing the new user's filled-in parameters
        if @myuser.save
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @myuser
        else
            render 'new'
        end
    end

end
