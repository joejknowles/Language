class InflectedWordsGroup < ActiveRecord::Base
  belongs_to :word_family
  has_many :inflected_words_groupings
  has_many :inflected_words, through: :inflected_words_groupings
  has_many :word_grammemes, through: :inflected_words
  accepts_nested_attributes_for(
    :inflected_words,
    :inflected_words_groupings, :word_grammemes)
end
