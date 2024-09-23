class GendersController < ApplicationController
  def index
    @genders = Gender.all.order(name: :asc).page(params[:page]).per(5)

  end  

  def show
    begin
      @gender = Gender.find(params[:id])
      @movies = Movie.where("gender_id = ?", @gender.id).first(5)
      @directors = Director.where("gender_id = ?", @gender.id).first(5)
    rescue
      redirect_to root_path, alert: 'Gênero não localizado'
    end
  end

  def new
    @gender = Gender.new
  end

  def create
    @gender = Gender.new(gender_params)
    @gender.name = format_name(@gender.name)
  
    if @gender.save
      redirect_to genders_path, notice: 'Gênero salvo com sucesso'
    else
      flash.now[:alert] = 'Não foi possível concluir esta operação.'
      render :new
    end
  end
  
  def edit
    begin
      @gender = Gender.find(params[:id])
    rescue
      redirect_to root_path, alert: 'Gênero não localizado'
    end
  end

  def update
    begin
      @gender = Gender.find(params[:id])
      params = gender_params
      params[:name] = format_name(params[:name])

      if @gender.update(params)
        redirect_to genders_path, notice: 'Gênero atualizado com sucesso'
      else
        flash.now[:alert] = 'Não foi possível concluir esta operação.'
        render :edit
      end
    rescue
      redirect_to root_path, alert: 'Gênero não localizado'
    end
  end

  private

  def gender_params
    params.require(:gender).permit(:name)
  end
end
