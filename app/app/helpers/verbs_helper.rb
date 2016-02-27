module VerbsHelper
  def self.get_verbs
    Verb.all
  end
  def self.create_en_cz(conjugations)

    Verb.create(verb_ID: verb_ID, verbal_aspect: 1)
  end
end
