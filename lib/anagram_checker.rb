class AnagramChecker

  def self.find_anagrams(subject, str)
    subject_chars = chars(subject)
    get_word_arr(str)
      .map { |word| word if same?(subject_chars, chars(word)) }
      .compact
  end

  def self.any_anagrams?(subject, str)
    subject_chars = chars(subject)
    get_word_arr(str).each do |word|
      return true if same?(subject_chars, chars(word))
    end
    false
  end

  def self.anagrams?(subject, str)
    same?(chars(subject), chars(str))
  end

  def self.same?(arr1, arr2)
    arr1.sort == arr2.sort
  end

  def self.chars(word)
    word.downcase.gsub(/\W+/, "").chars
  end

  def self.get_word_arr(input)
    input.split(/\W+/)
  end

  private_class_method :same?, :chars, :get_word_arr
end
