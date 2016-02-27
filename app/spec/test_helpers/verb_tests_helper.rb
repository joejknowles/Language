module VerbTestsHelper
  def self.create_verb_to_be
    Verb.create_en_cz(
      cz_infinitive: "být", en_infinitive: "to be",
      cz_first_s: "jsem", en_first_s: "am",
      cz_second_s: "jsi", en_second_s: "are",
      cz_third_s: "je", en_third_s: "is",
      cz_first_p: "jsme", en_first_p: "are",
      cz_second_p: "jste", en_second_p: "are",
      cz_third_p: "jsou", en_third_p: "are")
  end
end