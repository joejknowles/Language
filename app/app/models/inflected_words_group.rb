class InflectedWordsGroup < ActiveRecord::Base
  belongs_to :word_family
  has_many :inflected_words_groupings, inverse_of: :inflected_words_group
  has_many :inflected_words, through: :inflected_words_groupings
  accepts_nested_attributes_for :inflected_words, :inflected_words_groupings
end
