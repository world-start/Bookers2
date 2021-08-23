class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.all
   
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render edit_user_path(current_user)
    end
    # edit_user_pathの引数
  end
  

 private
 def user_params
   params.require(:user).permit(:name,:profile_image, :introduction)
 end
end
