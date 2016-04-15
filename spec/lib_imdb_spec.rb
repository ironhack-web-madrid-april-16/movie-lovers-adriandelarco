require File.expand_path('../../lib/imdb.rb', __FILE__)

RSpec.describe '/lib/.imdb' do
  before(:each) do
    Imdb_Search_fake.new('StaAD 1', 2005, 'director1', 'company', 'writter')
    Imdb_Search_fake.new('Stfdsfrs 2', 2006, 'director2', 'company', 'writter')
    Imdb_Search_fake.new('Star Wars 3', 2007, 'director3', 'company', 'writter')
    Imdb_Search_fake.new('Star Wars 4', 2009, 'director4', 'company', 'writter')
    Imdb_Search_fake.new('SDfrs 5', 1955, 'director5', 'company', 'writter')
    Imdb_Search_fake.new('Star Wars 6', 2505, 'director6', 'company', 'writter')
    Imdb_Search_fake.new('Star Wars 7', 2001, 'director7', 'company', 'writter')
    Imdb_Search_fake.new('Star Wars 8', 2045, 'director8', 'company', 'writter')
    Imdb_Search_fake.new('Star Wars 9', 2000, 'director9', 'company', 'writter')
    Imdb_Search_fake.new('Star Wars 10', 2000, 'director10', 'company', 'writter')
    Imdb_Search_fake.new('Star Wars 11', 2000, 'director11', 'company', 'writter')
    Imdb_Search_fake.new('Star Wars 12', 2005, 'director12', 'company', 'writter')
    Imdb_Search_fake.new('Star Wars 13', 2010, 'director13', 'company', 'writter')
    Imdb_Search_fake.new('Dog', 1985, 'director14', 'company', 'writter')
    Imdb_Search_fake.new('Stear Wars 15', 1986, 'director15', 'company', 'writter')
    Imdb_Search_fake.new('dog Wars 16', 1567, 'director16', 'company', 'writter')
    Imdb_Search_fake.new('Dog', 1985, 'director14', 'company', 'writter')
    Imdb_Search_fake.new('Super Dog', 1986, 'director15', 'company', 'writter')
    Imdb_Search_fake.new('Cat', 1567, 'director16', 'company', 'writter')
  end
  describe '#search by title' do
    it 'returns and array if there is more than 5 movies' do
      expect(Imdb_data.search('Star Wars', true).size).to eq(10)
    end
    it 'returns false if there is less than 5 movies' do
      expect(Imdb_data.search('Godfather', true)).to eq(false)
    end
  end
  describe '#randmo search' do
    it 'returns an array with more than 2 movies' do
      expect(Imdb_data.random_search(true).size).to eq(4)
    end
  end
end
