class AnagramChecker

  def self.find_anagrams(subject, str)
    subject = char(subject)
    get_word_list(str)
      .map { |word| word if same?(subject, char(word)) }
      .compact
  end

  def self.any_anagrams?(subject, str)
    subject = char(subject)
    get_word_list(str).each do |word|
      return true if same?(subject, char(word))
    end
    false
  end

  def self.anagrams?(subject, str)
    same?(char(subject), char(str))
  end

  def self.same?(arr1, arr2)
    arr1.sort == arr2.sort
  end

  def self.char(word)
    word.downcase.split(//)
  end

  def self.get_word_list(input)
    input.split(/\W+/)
  end

  private_class_method :same?, :char, :get_word_list
end
