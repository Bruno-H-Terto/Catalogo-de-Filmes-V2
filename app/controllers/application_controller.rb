class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def format_name(name)
    name.split(" ").map { |p| p.capitalize }.join(" ")
  end

  def genders_any
    redirect_to new_gender_path, notice: "Cadastre um gênero" if Gender.all.empty?
  end

  def director_any
    redirect_to new_director_path, notice: "Cadastre um diretor" if Director.all.empty?
  end
end
