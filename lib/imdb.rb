# Define the blog object and its logic
require 'rubygems'
require 'imdb'
require 'pry'
require 'random-word'

class Imdb_movies
  attr_accessor :movies
  def initialize
    @movies = []
  end

  def random_search
    @search = []
    (0..8).each do |_number|
      search_data = Imdb::Search.new(RandomWord.nouns.next)
      while search_data.movies[0..0].collect(&:poster) == [nil] || search_data.movies[0..0].collect(&:poster) == [] || search_data.movies[0..0].collect(&:poster) == [""] || search_data.movies[0..0].collect(&:director) == [nil]
        search_data = Imdb::Search.new(RandomWord.nouns.next) 
      end
      @search << [search_data.movies[0..0].collect(&:poster), search_data.movies[0..0].collect(&:title), search_data.movies[0..0].collect(&:year), search_data.movies[0..0].collect(&:director)]
    end
    obtain_movies
  end

  def search(title)
    search_data = Imdb::Search.new(title)
    @search = []
    i = 0
    a = 0
    while i < (9 + a)
      if search_data.movies[i..i].collect(&:poster) != [nil] || search_data.movies[0..0].collect(&:poster) == [nil]
        @search << [search_data.movies[i..i].collect(&:poster), search_data.movies[i..i].collect(&:title), search_data.movies[i..i].collect(&:year), search_data.movies[i..i].collect(&:director)]
        i += 1
      else
        i += 1
        a += 1
      end
    end
    obtain_movies
  end

  def fake_search(fake_array_search)
    @search = fake_array_search
    obtain_movies
  end

  def obtain_movies
    i = 0
    (0..8).each_with_index do |_movie, index|
      movie_poster = @search[index][0]
      movie_title = @search[index][1]
      movie_year = @search[index][2]
      movie_director = @search[index][3]
      @movies << [movie_poster, movie_title, movie_year, movie_director]
    end
  end
end
