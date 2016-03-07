class Grammeme < ActiveRecord::Base
  belongs_to :grammatical_category
  has_many :word_grammemes
  has_many :inflected_words, through: :word_grammemes
end
