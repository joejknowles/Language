class ConjugatedVerb < ActiveRecord::Base
  belongs_to :form
  belongs_to :language
  belongs_to :person
  has_many :conjugated_verb_pairs, through: :conjugated_verb_pairings
end
