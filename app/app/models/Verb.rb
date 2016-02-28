class Verb < ActiveRecord::Base
  belongs_to :verbal_aspect
  has_many :conjugated_verb_pairs
end
