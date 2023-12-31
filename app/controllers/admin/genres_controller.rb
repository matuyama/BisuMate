class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.page(params[:page]).per(8)
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admin_genres_path
    else
      flash[:notice] = "保存に失敗しました"
      redirect_to admin_genres_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      redirect_to admin_genres_path
    else
      flash[:notice] = "編集に失敗しました"
      redirect_to admin_genres_path
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
