class AnagramChecker
  def self.find_anagrams(subject, str)
    subject = process(subject)
    get_word_list(str).map { |word| word if anagram?(subject, process(word)) }.compact
  end

  private

  def self.get_word_list(input)
    input.split(/\W+/)
  end

  def self.process(word)
    word.downcase.split(//)
  end

  def self.anagram?(subject_arr, word_arr)
    (subject_arr - word_arr).empty?
  end
end
