require	'sinatra'
require 'haml'
require 'sinatra/reloader' if development?
require './lib/imdb.rb'
require './lib/quizz.rb'
require 'pry'
require 'rubygems'

set :haml, format: :html5
enable(:sessions)

get('/') do
  redirect to('/index')
end

get('/index') do
  haml(:index)
end

post('/movies') do
  search_method = params['search_method']
  imdb_data = Imdb_movies.new
  if search_method == 'search'
    search_term = params[:search_term]
    imdb_data.search(search_term)
  elsif search_method == 'random'
    imdb_data.random_search
  end
  @movies = imdb_data.movies
  quizz = Quizz.new(@movies)
  @answer = quizz.answer
  @question = quizz.question
  @question_id = quizz.question_id
  haml(:movies)
end
