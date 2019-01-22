class AnagramChecker

  def self.anagrams?(subject, str)
    same_arr?(char_arr(subject), char_arr(str))
  end

  def self.find_anagrams(subject, str)
    subject = char_arr(subject)
    get_word_list(str).map { |word| word if same_arr?(subject, char_arr(word)) }.compact
  end

  def self.any_anagrams?(subject, str)
    subject = char_arr(subject)
    get_word_list(str).each do |word|
      return true if same_arr?(subject, char_arr(word))
    end
    false
  end

  def self.char_arr(word)
    word.downcase.split(//)
  end

  def self.same_arr?(arr1, arr2)
    (arr1 - arr2).empty?
  end

  def self.get_word_list(input)
    input.split(/\W+/)
  end

  private_class_method :get_word_list, :char_arr, :same_arr?
end
