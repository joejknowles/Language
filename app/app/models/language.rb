class Language < ActiveRecord::Base
  has_many :inflected_words
end
