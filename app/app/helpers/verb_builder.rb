module VerbBuilder
  def self.new_word(params, flash)
    flash = flash
    @family = WordFamily.new
    @family.word_class = WordClass.find_by(word_class_name: 'verb')
    groups_attributes = params[:inflected_words_groups_attributes]

    groups_attributes.each do |group_params|
      group_params = group_params[1]

      group = InflectedWordsGroup.new
      group.word_family = @family
      @family.inflected_words_groups << group
      words_attributes = group_params[:inflected_words_attributes]

      words_attributes.each do |word_params|
        word_params = word_params[1]

        word_n = word_params[:word]

        language_id = word_params[:language_id]

        grammeme_id = word_params[:word_grammemes_attributes]['0'][:grammeme_id]

        grammeme = Grammeme.find(grammeme_id)
        word = InflectedWord.new(word: word_n, language_id: language_id)
        word.grammemes << grammeme
        unless word.save
          flash[:notices] = word.errors.full_messages
          return false
        end
        group.inflected_words << word
      end
      return false unless group.save
      @family.inflected_words_groups << group
    end

    @family
  end
end