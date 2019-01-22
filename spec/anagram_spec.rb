require 'anagram'
require 'benchmark'

describe Anagram do

  describe '#find_anagrams' do
    it 'can return anagram words given a list with commas' do
      expect(Anagram.find_anagrams('silent', 'listen, apple, window'))
        .to eq(['listen'])
    end

    it 'can return anagram words given a list with spaces' do
      expect(Anagram.find_anagrams('silent', 'listen apple window'))
        .to eq(['listen'])
    end

    it 'can return anagram words given a mixed case list' do
      expect(Anagram.find_anagrams('listen', 'silent, APPLE, window')).to eq(['silent'])
    end

    it 'returns empty array when no anagrams are found' do
      expect(Anagram.find_anagrams('listen', 'apple, window')).to eq([])
    end

    it 'can process large numbers of inputs' do
      skip
      n = 1000000
      input = 'word' * n
      puts "Time to process #{n} records"
      puts Benchmark.measure { Anagram.find_anagrams('listen', input) }
      expect(true).to eq(true)
    end

    it 'can return anagram words in the right case' do
      expect(Anagram.find_anagrams('listen', 'SILENT, APPLE, window')).to eq(['SILENT'])
    end
  end
end
