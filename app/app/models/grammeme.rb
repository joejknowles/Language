class Grammeme < ActiveRecord::Base
  belongs_to :grammatical_category
  has_many :word_grammemes, inverse_of: :grameme
  has_many :inflected_words, through: :word_grammemes
end
