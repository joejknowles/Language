class ConjugatedVerbPairing < ActiveRecord::Base
  belongs_to :conjugated_verb_pair
  belongs_to :conjugated_verb
end
