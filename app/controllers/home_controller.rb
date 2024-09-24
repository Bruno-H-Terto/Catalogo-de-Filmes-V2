class HomeController < ApplicationController
  def index
    @movies = Movie.published.order(name: :asc)
    
    movies_with_photos = @movies.select do |movie|
      movie.photo.attached?
    end
  
    @films_on_display = Kaminari.paginate_array(movies_with_photos).page(params[:movies_page]).per(3)
  end
  
end
