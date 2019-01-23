require 'anagram_checker'
require 'benchmark'

describe AnagramChecker do
  describe '#find_anagrams' do
    it 'can return anagram words given a list with commas' do
      expect(AnagramChecker.find_anagrams('silent', 'listen, apple, window'))
        .to eq(['listen'])
    end

    it 'can return anagram words given a list with spaces' do
      expect(AnagramChecker.find_anagrams('silent', 'listen apple window'))
        .to eq(['listen'])
    end

    it 'can return anagram words given a mixed case list' do
      expect(AnagramChecker.find_anagrams('listen', 'silent, APPLE, window')).to eq(['silent'])
    end

    it 'can return anagram words in the right case' do
      expect(AnagramChecker.find_anagrams('listen', 'SILENT, APPLE, window')).to eq(['SILENT'])
    end

    it 'ignores hyphenation' do
      expect(AnagramChecker.find_anagrams('listen', 'SILE-NT, APPLE, window')).to eq(['SILE-NT'])
    end

    it 'returns empty array when no anagrams are found' do
      expect(AnagramChecker.find_anagrams('listen', 'apple, window')).to eq([])
    end

    it 'can process large number of inputs' do
      skip
      n = 1_000_000
      input = 'word ' * n
      puts "Time to process #{n} records"
      puts Benchmark.measure { AnagramChecker.find_anagrams('listen', input) }
      expect(true).to eq(true)
    end
  end

  describe '#any_anagrams?' do
    it 'returns true if any anagrams are found on the list' do
      expect(AnagramChecker.any_anagrams?('listen', 'silent, apple, window')).to eq(true)
    end

    it 'returns false if no anagrams are found on the list' do
      expect(AnagramChecker.any_anagrams?('listen', 'apple, window')).to eq(false)
    end
  end

  describe '#anagrams?' do
    it 'returns true if two strings are anagrams of each other' do
      expect(AnagramChecker.anagrams?('a cat on a mat', 'a cat on a mat')).to eq(true)
    end

    it 'returns false if two strings are not anagrams of each other' do
      expect(AnagramChecker.anagrams?('a cat on a mat', 'a cat on a ma')).to eq(false)
    end

    it 'returns true if two strings are anagrams but have diff spacing' do
      expect(AnagramChecker.anagrams?('cat', 'c a t')).to eq(true)
    end

    it 'returns true if two strings are anagrams but have diff punctuation' do
      expect(AnagramChecker.anagrams?('cat', 'cat!')).to eq(true)
    end

    it 'ignores hyphenation' do
      expect(AnagramChecker.anagrams?('rat-a-tat', 'ratatat')).to eq(true)
    end
  end
end
