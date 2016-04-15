require 'rubygems'
require 'imdb'
require 'pry'
require 'random-word'
require File.expand_path('../imdb_Search_fake.rb', __FILE__)

# Search for movies in IMDB database and return an object that contain
# those movies in an array of objects that are the movies.
class Imdb_data
  def self.search(title, fake = false)
    fake == false ? search_data = Imdb::Search.new(title).movies : search_data = Imdb_Search_fake.search(title)
    search_data.size > 5 ? search_data : false
  end

  def self.random_search(fake = false)
    fake == false ? search_data = Imdb::Search.new(RandomWord.nouns.next).movies : search_data = Imdb_Search_fake.search('dog')
    search_data.size > 2 ? search_data : random_search
  end
end
