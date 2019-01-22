require 'anagram'

describe Anagram do
  let (:anagram) { Anagram.new }

  describe '#find_anagrams' do
    it 'can return anagram words given a list with commas' do
      expect(anagram.find_anagrams('silent', 'listen, apple, window'))
        .to eq(['listen'])
    end

    it 'can return anagram words given a list with spaces' do
      expect(anagram.find_anagrams('silent', 'listen apple window'))
        .to eq(['listen'])
    end

    it('can return anagram words given a mixed case list') do
      expect(anagram.find_anagrams('listen', 'Silent, APPLE, window')).to eq(['silent'])
    end

    it('returns empty array when no anagrams are found') do
      expect(anagram.find_anagrams('listen', 'apple, window')).to eq([])
    end
  end
end
