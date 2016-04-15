require	'sinatra'
require 'haml'
require 'sinatra/reloader' if development?
require './lib/imdb.rb'
require './lib/quizz.rb'
require './lib/movies_selector.rb'
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
  movies_selector = Movies_selector.new
  if search_method == 'search'
    keyword = params[:keyword]
    @movies = movies_selector.by_keyword(keyword)
  elsif search_method == 'random'
    @movies = movies_selector.random
  end
  if @movies != nil
    quizz = Quizz.new(@movies)
    @answer = quizz.answer
    @question = quizz.question
    @question_method = quizz.question_method
    haml(:movies)
  else
    haml(:error)
  end
end
