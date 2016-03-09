class VerbsController < ApplicationController
  def index
    # VerbsHelper.add_verb_database_dependencies
    # VerbsHelper.create_to_be
    @verbs = VerbsHelper.all_verbs
  end

  def new
    @verb = WordFamily.new
    @grammemes = Grammeme.all
    @languages = Language.all
    @grammemes.each do |grammeme|
      group = @verb.inflected_words_groups.build
      @languages.each do |language|
        word = group.inflected_words.build(language: language)
        word.grammemes << grammeme
        word.word_grammemes.build(grammeme: grammeme)
      end
    end
  end

  def create
    @verb = VerbsHelper.new_word(word_family_params)

    if @verb.is_a?(WordFamily) && @verb.save!
      flash[:notice] = ['word successfully added']
      redirect_to '/verbs'
    else
      flash[:notice] = ['Please fill in all fields']
      redirect_to '/verbs/new'
    end
  end

  def word_family_params
    params.require(:word_family).permit(
      inflected_words_groups_attributes:
        [
          inflected_words_attributes:
          [
            :word, :language_id,
            word_grammemes_attributes:
              [:grammeme_id]
          ]
        ])
  end
end
