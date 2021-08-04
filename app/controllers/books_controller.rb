class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "本を登録完了"
    else
      render :new
    end
  end

  def show

  end

  def edit
    
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "更新完了"
    else
      render :edit
    end
  end
  
  def destroy
    @book.destroy
    redirect_to books_path, notice: "本の削除完了"
  end

  private

  def book_params
    params.require(:book).permit(:title, :new_image, :price, :read_date, :category_id, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
