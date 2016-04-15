require File.expand_path('../imdb.rb', __FILE__)
require 'pry'
class Quizz
  attr_reader :question, :question_method
  def initialize(movies)
    @movies = movies
    @question = ''
    @question_method = ''
  end

  def year
    years = @movies.map { |movie| movie.year.nil? ? next : movie.year; }
    @question = "Which movie was released in #{years.sample}?"
    @question_method = :year
    years.sample
  end

  def director
    directors = @movies.map(&:director)
    @question = "Which movie was directed by #{directors.sample}?"
    @question_method = :director
    directors.sample
 end

  def company
    companies = @movies.map(&:company)
    @question = "Which movie was directed by #{companies.sample}?"
    @question_method = :company
    companies.sample
  end

  def writers
    writers = @movies.map(&:writers)
    @question = "Which movie was directed by #{writers.sample}?"
    @question_method = :writers
    writers.sample
  end

  def answer
    questions = %i(year director company writers)
    send questions.sample
  end
end
