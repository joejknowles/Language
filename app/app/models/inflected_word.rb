class InflectedWord < ActiveRecord::Base
  belongs_to :language
  has_many :word_grammemes, inverse_of: :inflected_word
  has_many :grammemes, through: :word_grammemes
  has_many :inflected_words_groupings, inverse_of: :inflected_word
  has_many :inflected_words_groups, through: :inflected_words_groupings
  validates_presence_of :word, :language, :grammemes
  accepts_nested_attributes_for :language, :grammemes, :word_grammemes
end
