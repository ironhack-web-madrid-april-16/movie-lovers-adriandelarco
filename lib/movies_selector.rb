require File.expand_path('../imdb.rb', __FILE__)
require File.expand_path('../imdb_Search_fake.rb', __FILE__)
require File.expand_path('../fake_array.rb', __FILE__)
require 'rubygems'
require 'imdb'
require 'pry'
require 'random-word'

# Select and filter movies from any source to show those
# movies in the website as desired. Returns @movies.
class Movies_selector
  attr_accessor :movies
  def initialize(number_movies = 9, fake = false)
    @movies = []
    @number_movies = number_movies
    @fake = fake
  end

  def by_keyword(keyword_to_search)
    @fake == false ? array_movies = Imdb_data.search(keyword_to_search) : array_movies = Fake_array.new.array1
    array_movies == false ? return : filter_with_posters(array_movies)

    @movies
  end

  def filter_with_posters(array_movies)
    i = 0
    while @movies.size < @number_movies
      @movies << (array_movies[i]) unless array_movies[i].poster.nil?
      i += 1
      break if i > 100 # #To avoid inifinite loops looking for posters.
    end
  end

  def random
    @number_movies.times do |_i|
      array_movies = Imdb_data.random_search
      array_movies = Imdb_data.random_search while array_movies[0].poster.nil?
      @movies << array_movies[0]
    end
    @movies
  end
end
