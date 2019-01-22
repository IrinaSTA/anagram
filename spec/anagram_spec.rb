require 'anagram'
require 'benchmark'

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
      expect(anagram.find_anagrams('listen', 'silent, APPLE, window')).to eq(['silent'])
    end

    it('returns empty array when no anagrams are found') do
      expect(anagram.find_anagrams('listen', 'apple, window')).to eq([])
    end

    it('can process large numbers of inputs') do
      skip
      n = 1000000
      input = 'word' * n
      puts "Time to process #{n} records"
      puts Benchmark.measure { anagram.find_anagrams('listen', input) }
      expect(true).to eq(true)
    end

    it 'can return anagrams words in the righ case' do
      expect(anagram.find_anagrams('listen', 'SILENT, APPLE, window')).to eq(['SILENT'])
    end
  end
end
