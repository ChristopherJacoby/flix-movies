class MoviesController < ApplicationController

  def index
    @movies = Movie.released
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
      else
        render :new, status: :unprocessable_entity
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    # params[:movie].permit(:title, :description, :rating, :released_on, :total_gross) or
    # params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross) or
    # movie_params = params.require(:movie).permit!
    @movie.update(movie_params)
    if @movie.save
      flash[:notice] = "Movie sucessfully updated!"
      redirect_to @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path, status: :see_other, alert: "Movie successfully deleted!"
  end

  private

  def movie_params
    params.require(:movie).
      permit(:title, :description, :rating, :released_on, :total_gross, :director, :duration, :image_file_name)
  end

end
