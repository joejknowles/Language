class WordFamily < ActiveRecord::Base
  belongs_to :word_class
  has_many :inflected_words_groups
  accepts_nested_attributes_for :inflected_words_groups

  def self.all_verbs
    verb_class = WordClass.find_by(word_class_name: 'verb')
    where(word_class: verb_class)
  end
end
