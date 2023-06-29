class UsersController < ApplicationController
    before_action :require_user, except: [:new, :create]

    def index
        @users = User.all
    end


    def show
        @user = User.find(params[:user_id])
    end


    #This section handles the creation of new users
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "#{@user.username.capitalize}You have successfully signed up"
            redirect_to root_path
        else
            render 'new'
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :phone, :password)
    end

end