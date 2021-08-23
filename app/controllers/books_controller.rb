class BooksController < ApplicationController
  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      @newbook = Book.new
      render :index
    end
    
    
  end
  
  
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
    
    # なぜ@book = Book.find(params[:id])はindexでは作れないのか？
  end
  
  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def edit
    @book = Book.find(params[:id])
   
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    
    if book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(book.id)
    else
      @book = Book.find(params[:id])
      render :edit
    end
    
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end

