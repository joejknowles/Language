module VerbTestsHelper
  def self.create_verb_to_be
    VerbsHelper.create_en_cz(
      cz:
      {
        infinitive: "být",
        first_s: "jsem",
        second_s: "jsi",
        third_s: "je",
        first_p: "jsme",
        second_p: "jste",
        third_p: "jsou"
      },
      en:
      {
        infinitive: "to be",
        first_s: "am",
        second_s: "are",
        third_s: "is",
        first_p: "are",
        second_p: "are",
        third_p: "are"
      }
    )
  end
  def self.create_verbal_aspects
    VerbalAspect.first_or_create(name: "perfective")
    VerbalAspect.first_or_create(name: "imperfective")
  end
end