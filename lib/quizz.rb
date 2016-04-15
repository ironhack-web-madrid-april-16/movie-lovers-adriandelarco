require File.expand_path('../imdb.rb', __FILE__)
require 'pry'
class Quizz
  attr_reader :question, :question_id
  def initialize(movies)
    @movies = movies
    @question = ""
    @question_id = 0
  end
  def year
    years = @movies.map { |movie| movie[2][0] }
    @question = "Which movie was released in? #{years.sample}"
    @question_id = 2
    years.sample
  end
   def director
    directors = @movies.map { |movie| movie[3][0] }
    @question = "Which movie was directed by? #{directors.sample}"
    @question_id = 3
    directors.sample
  end
  def answer
  	questions = %i[year director]
	  send questions.sample
  end
end
