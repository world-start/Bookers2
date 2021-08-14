class BooksController < ApplicationController
  
  
  def create
    @book = Book.new(book_params)
    @book = curentn_user.id
    @book.save
    redirect_to books_path
  end
  
  def update
  end
  
  def index
    @books = Book.all
  end
  
  def show
    @books = Book.all
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end

