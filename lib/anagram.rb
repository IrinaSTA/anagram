class Anagram
  def find_anagrams(subject, str)
    subject = process_word(subject)
    process_input(str).map { |word| word if anagram?(subject, process_word(word)) }.compact
  end

  private

  def process_input(input)
    input.downcase.split(/\W+/)
  end

  def process_word(word)
    word.split(//)
  end

  def anagram?(subject, word)
    (subject - word).empty?
  end
end
