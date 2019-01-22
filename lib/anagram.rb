class Anagram
  def self.find_anagrams(subject, str)
    subject = process_word(subject)
    process_input(str).map { |word| word if anagram?(subject, process_word(word)) }.compact
  end

  private

  def self.process_input(input)
    input.split(/\W+/)
  end

  def self.process_word(word)
    word.downcase.split(//)
  end

  def self.anagram?(subject, word)
    (subject - word).empty?
  end
end
