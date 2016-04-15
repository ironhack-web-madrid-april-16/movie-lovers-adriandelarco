require 'rubygems'
require 'imdb'
require 'pry'
require 'random-word'

# Search for movies in IMDB database and return an object that contain
# those movies in an array of objects that are the movies.
class Imdb_Search_fake
  attr_reader :movies, :poster
  @@movies = []
  def initialize(title, year, director, company, poster)
    @title = title
    @year = year
    @director = director
    @company = company
    @poster = poster
    @@movies << [title, year, director, company, poster]
  end

  def self.movies
    @@movies
  end

  def self.search(title)
    @@movies.select! do |movie|
      movie[0].downcase.include? title.downcase
    end
    @@movies
  end

  def self.movies
    @@movies
  end
end
