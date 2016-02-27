module VerbsHelper
  def self.get_verbs
    Verb.all
  end
  def self.create_en_cz(conjugations)
    verb = Verb.create(verbal_aspect: 1)
    form.each do |form_name, id|
      en_form = self.conjugation("en", conjugations, form_name)
      cz_form = self.conjugation("cz", conjugations, form_name)
      source_verb = ConjugatedVerb.Create(form_id: id, language_id: 1,
                                          conjugation: en_form)
      source_verb = ConjugatedVerb.Create(form_id: id, language_id: 2,
                                          conjugation: cz_form)
      ConjugatedVerbPair.Create(verb: verb,
                                source_language_conjugated_verb: source_verb,
                                target_language_conjugated_verb: czech_verb)
    end
  end

  private
  def self.prefix_sym(prefix, symbol)
    (prefix + "_" << symbol).to_sym
  end
  def self.conjugation(language, conjugations, form_name)
    conjugations[self.prefix_sym(language, form_name)]
  end
  def self.form
    {
      infinitive: 7,
      first_s: 1,
      second_s: 2,
      third_s: 3,
      first_p: 4,
      second_p: 5,
      third_p: 6
    }
  end
end
