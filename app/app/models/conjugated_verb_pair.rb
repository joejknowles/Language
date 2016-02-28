class ConjugatedVerbPair < ActiveRecord::Base
  belongs_to :verb
  has_many :conjugated_verb_pairings
  has_many :conjugated_verbs, through: :conjugated_verb_pairings
end
