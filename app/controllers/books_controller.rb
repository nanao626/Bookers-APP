class BooksController < ApplicationController

  def top
  end

  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    
  end

  def create
    @book = Book.new(book_params)
    if @book.save
       flash[:notice] = "Book was successfully created."
    
    redirect_to book_path(@book) #成功の場合
  else 
    @books = Book.all    
    render 'index' #失敗の場合 
  end
end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
    flash[:notice] = "Book was successfully updated."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed."
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
