class Phrase

  attr_reader :context
  def initialize context
    context = remove_punctuation(context)
    context = downcase_all_characters(context)
    @words  = split_the_context_by_space(context)
  end

  def word_count
    @words
  end

  private

  def remove_punctuation context
    context = context.gsub(/[^0-9A-Za-z]/, " ")
  end

  def downcase_all_characters context
    context = context.downcase
  end

  def split_the_context_by_space(context)
    context = context.split(" ")
  end
end
