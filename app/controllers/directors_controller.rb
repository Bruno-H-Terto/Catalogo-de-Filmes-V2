class DirectorsController < ApplicationController
  before_action :genders_any, except: [ :index ]
  def index
    @directors = Director.all.order(name: :asc).page(params[:page]).per(5)
  end

  def show
    begin
      @director = Director.find(params[:id])
      @movies = Movie.where("director_id = ?", @director.id).order(name: :asc).page(params[:movies_page]).per(5)
    rescue
      redirect_to root_path, alert: "Não foi possível localizar o diretor procurado"
    end
  end
  def new
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)
    @director.name = format_name(@director.name)

    if @director.save
      redirect_to @director, notice: "Diretor incluido com sucesso"
    else
      flash.now[:alert] = "Não foi possível concluir está operação"
      render :new
    end
  end

  def edit
    begin
      @director = Director.find(params[:id])
    rescue
      redirect_to root_path, alert: "Não foi possível localizar o diretor procurado"
    end
  end

  def update
    begin
      @director = Director.find(params[:id])
      params = director_params
      params[:name] = format_name(params[:name])

      if @director.update(params)
        redirect_to @director, notice: "Diretor atualizado com sucesso"
      else
        flash.now[:alert] = "Não foi possível concluir está operação"
        render :new
      end
    rescue
      redirect_to root_path, alert: "Não foi possível localizar o diretor procurado"
    end
  end

  private

  def director_params
    params.require(:director).permit(:name, :nationality, :birthday, :gender_id)
  end
end
