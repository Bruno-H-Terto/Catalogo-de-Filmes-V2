class DirectorsController < ApplicationController
  
  def index
    @directors = Director.all.order(name: :asc)
  end

  def show
    begin
      @director = Director.find(params[:id])
    rescue
      redirect_to root_path, alert: 'Não foi possível localizar o diretor procurado'
    end
  end
  def new
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)

    if @director.save
      redirect_to @director, notice: "Diretor incluido com sucesso"
    else
      flash.now[:alert] = 'Não foi possível concluir está operação'
      render :new
    end
  end

  def edit
    begin
      @director = Director.find(params[:id])
    rescue
      redirect_to root_path, alert: 'Não foi possível localizar o diretor procurado'
    end
  end

  def update
    begin
      @director = Director.find(params[:id])

      if @director.update(director_params)
        redirect_to @director, notice: "Diretor atualizado com sucesso"
      else
        flash.now[:alert] = 'Não foi possível concluir está operação'
        render :new
      end
    rescue
      redirect_to root_path, alert: 'Não foi possível localizar o diretor procurado'
    end
  end

  private

  def director_params
    params.require(:director).permit(:name, :nationality, :birthday, :gender_id)
  end
end
