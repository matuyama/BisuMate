class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to
    else
      flash.now[:notice] = "保存に失敗しました"
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path
    else
      flash.now[:notice] = "編集に失敗しました"
      render :index
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
