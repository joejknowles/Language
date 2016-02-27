require 'verb_creator'
module VerbsHelper
  def self.get_verbs
    Verb.all
  end
  def self.create_en_cz(conjugations)
    verb_creator = VerbCreator.new
    verb_creator.create(conjugations: conjugations)
  end
end
