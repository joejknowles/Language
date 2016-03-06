class InflectedWordsGrouping < ActiveRecord::Base
  belongs_to :inflected_words_group
  belongs_to :inflected_word
end
