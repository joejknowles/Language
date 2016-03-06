class WordGrammeme < ActiveRecord::Base
  belongs_to :grammeme
  belongs_to :inflected_word
  accepts_nested_attributes_for :grammeme, :inflected_word
end
