class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order('name ASC')
  end
end
