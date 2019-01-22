class AnagramChecker

  def self.find_anagrams(subject, str)
    subject = process(subject)
    get_word_list(str).map { |word| word if anagram?(subject, process(word)) }.compact
  end

  def self.any_anagrams?(subject, str)
    subject = process(subject)
    get_word_list(str).each do |word|
      return true if anagram?(subject, process(word))
    end
    false
  end

  def self.get_word_list(input)
    input.split(/\W+/)
  end

  def self.process(word)
    word.downcase.split(//)
  end

  def self.anagram?(subject_arr, word_arr)
    (subject_arr - word_arr).empty?
  end

  private_class_method :get_word_list, :process, :anagram?
end
