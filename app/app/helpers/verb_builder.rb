module VerbBuilder
  def self.new_word(params)
    @family = WordFamily.new
    @family.word_class = WordClass.find_by(word_class_name: 'verb')
    groups_attributes = params[:inflected_words_groups_attributes]
    p '###########groups attributes############', groups_attributes
    groups_attributes.each do |group_params|
      group_params = group_params[1]
      p '###########groups params############',  group_params
      group = InflectedWordsGroup.new
      group.word_family = @family
      @family.inflected_words_groups << group
      words_attributes = group_params[:inflected_words_attributes]
      p '###########words attributes############',  words_attributes
      words_attributes.each do |word_params|
        word_params = word_params[1]
        p '###########word params############',  word_params
        word_n = word_params[:word]
        p '###########    word_n   ############',  word_n
        language_id = word_params[:language_id]
        p '###########    language_id   ############',  language_id
        grammeme_id = word_params[:word_grammemes_attributes]['0'][:grammeme_id]
        p '###########    grammeme_id   ############',  grammeme_id
        grammeme = Grammeme.find(grammeme_id)
        word = InflectedWord.new(word: word_n, language_id: language_id)
        word.grammemes << grammeme
        p word
        return word unless word.save
        p word
        p group
        group.inflected_words << word
        p group
        p group.inflected_words_groupings.first
      end
      return group unless group.save
      p group
      @family.inflected_words_groups << group
    end
    p @family
    @family
  end

  def self.new_new_word(params)
    @family = WordFamily.new
    params[:inflected_words_groups_attributes].each do |group_params|
      group = InflectedWordsGroup.new
      group_params[1][:inflected_words_attributes].each do |word_params|
        word_grammeme = WordGrammeme.new(word_params[1][:word_grammeme_attributes])
        word = group.inflected_words.create(word_params[1])

        word.grammemes.each { |x| p x}
      end
      @family.inflected_words_groups << group
    end
    @family
  end
end