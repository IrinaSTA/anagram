require 'anagram'

describe Anagram do

  let (:anagram) { Anagram.new() }

  describe '#find_anagrams' do
    it 'can return anagram words given a list with commas' do
      expect(anagram.find_anagrams('silent', 'listen, apple, window')).
      to eq(['listen'])
    end
  end

end
