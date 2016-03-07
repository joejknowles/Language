module VerbBuilder
  def self.new_word(params)
    20.times { p 'here' }
    p params
    20.times { p 'here' }
    @family = WordFamily.new
    params[:inflected_words_groups_attributes].each do |group_params|
      group = InflectedWordsGroup.new
      group_params
    end
  end
end