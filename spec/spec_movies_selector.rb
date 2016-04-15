require File.expand_path('../../lib/movies_selector.rb', __FILE__)

RSpec.describe '/lib/.movies_selector' do
  describe '#search by title' do
    it 'returns and array if there is more than 5 movies' do
      movies_selector = Movies_selector.new(9, true)
      expect(movies_selector.by_keyword('Star Wars').size).to eq(9)
    end
  end
end
