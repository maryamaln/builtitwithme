class UsersController < ApplicationController
  #To create admin:
  # User.create(first_name: "admin",last_name: "admin",email: "admin@admin.com",password:"admin123",address: "Lahore",is_admin: true)
  before_action :authenticate_user,only: [:all_users]
  # before_action :authenticate_admin,only: [:all_users]
  layout 'custom_layout', :only => [:all_users,:show]
  def index
    # if !cookies[:user_id].nil? && !(cookies[:user_id]=="")
    #   redirect_to '/all_users'
    # end
    flash[:notice]=""
  	@user = User.new 
  end

  def register
    flash[:notice]=""
  	@user = User.new
  end

  def login
    user = User.where('email = ?', params[:user][:email]).first
    if user && user.authenticate(params[:user][:password])
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      cookies[:user_id]=user.id
      cookies[:user_name]=user.user_name
      # session[:user_id] = user.id
      # session[:first_name]=user.first_name
      redirect_to "/all_ideas"
    else
      flash[:notice] = "Invalid Email or password"
      flash[:color]= "invalid"
      @user = User.new
      render 'index'
    end
  end

  def logout
    cookies.delete(:user_id)
    cookies.delete(:user_name)
    # session[:user_id] = ""
    # session[:first_name]=""
    redirect_to "/"
  end

  def make_admin
    user = User.find(params[:id])
    user.update(is_admin: true)
    redirect_to '/all_users'
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    cookies[:user_id]=user.id
    cookies[:user_name]=user.user_name
    redirect_to "/all_users"
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:format])
 
  if @user.update(user_parameters)
    redirect_to '/all_users'
  else
    render 'edit'
  end
  end
  def create
    user = User.new(user_parameters)
    if user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to '/'
    else
      flash[:notice]=user.errors.full_messages[0]
      flash[:color]="invalid"
      @user=User.new
      render 'register'
    end
  end
  def all_users
    @users=User.all  
  end
  def show
    @user = User.find(params[:id])
  end
  #To Allow parameters
  private
    def user_parameters
      params.require(:user).permit(:first_name, :last_name,:email,:address,:password,:user_name)
    end
end
