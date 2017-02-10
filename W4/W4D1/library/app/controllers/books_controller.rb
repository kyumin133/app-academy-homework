class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
  end

  def create
    Book.create(title: params["book"]["title"], author: params["book"]["author"])
    redirect_to(books_url)
  end

  def destroy
    # fail
    book = Book.find(params["id"])
    book.destroy
    redirect_to(books_url)
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
