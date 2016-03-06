class VerbCreator
  def create_to_be
    word_class = WordClass.find_by(word_class_name: 'verb')
    @word_family = WordFamily.create(word_class: word_class)
    english = Language.find_by(language_name: 'English')
    czech = Language.find_by(language_name: 'Czech')
    grammemes = Grammeme.limit(10).to_a
    [['to be', 'být'],
     %w(am jsem), %w(are jsi), %w(is je),
     %w(are jsme), %w(are jste), %w(are jsou)].each do|pair|
      grammeme = grammemes.pop
      group = InflectedWordsGroup.create(word_family: @word_family)
      english_word = create_inflected_word(pair[0], english)
      english_word.grammemes << grammeme
      czech_word = create_inflected_word(pair[1], czech)
      czech_word.grammemes << grammeme
      InflectedWordsGrouping.create(inflected_words_group: group,
                                    inflected_word: english_word)
      InflectedWordsGrouping.create(inflected_words_group: group,
                                    inflected_word: czech_word)
    end
  end

  def create_inflected_word word, language
    InflectedWord.create(word: word, language: language)
  end
end