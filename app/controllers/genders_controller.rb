class GendersController < ApplicationController
  def index
    @genders = Gender.all.order(name: :asc)
  end  

  def show
    begin
      @gender = Gender.find(params[:id])
    rescue
      redirect_to root_path, alert: 'Gênero não localizado'
    end
  end

  def new
    @gender = Gender.new
  end

  def create
    @gender = Gender.new(gender_params)
    @gender.name = gender_params[:name].split(' ').map{ |p| p.capitalize}.join(' ')
  
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

      if @gender.update(gender_params)
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
