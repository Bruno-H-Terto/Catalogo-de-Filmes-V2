class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(name: :asc).page(params[:page]).per(5)
  end
  
  def show
    begin
      @movie = Movie.find(params[:id])
    rescue
      redirect_to root_path, alert: 'Filme não localizado'
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.name = format_name(@movie.name)

    if @movie.save
      redirect_to movies_path, notice: 'Filme cadastrado com sucesso'
    else
      flash.now[:alert] = 'Não foi possível concluir esta operação'
      render :new
    end
  end

  def edit
    begin
      @movie = Movie.find(params[:id])
    rescue
      redirect_to root_path, alert: 'Filme não localizado'
    end
  end

  def update
    begin
      @movie = Movie.find(params[:id])
      params = movie_params
      params[:name] = format_name(params[:name])

      if @movie.update(params)
        redirect_to @movie, notice: 'Filme atualizado com sucesso'
      else
        flash.now[:alert] = 'Não foi possível concluir esta operação'
        render edit
      end
    rescue
      redirect_to root_path, alert: 'Filme não localizado'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :year, :synopsis, :length, :gender_id, :director_id)
  end
end
