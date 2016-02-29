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

  def self.seed_verb_dependencies
    seed_verbal_aspects
    seed_languages
    seed_forms
    seed_all_persons
  end

  private

  def self.seed_verbal_aspects
    VerbalAspect.find_or_create_by(name: "perfective")
    VerbalAspect.find_or_create_by(name: "imperfective")
  end

  def self.seed_languages
    Language.find_or_create_by(name: 'English', abbreviation: 'en')
    Language.find_or_create_by(name: 'Czech', abbreviation: 'cz')
  end

  def self.seed_forms
    Form.find_or_create_by(name: 'infinitive')
    Form.find_or_create_by(name: 'present')
  end

  def self.seed_all_persons
    seed_persons('first singular',
                 'second singular',
                 'third singular',
                 'first plural',
                 'second plural',
                 'third plural'
                )
  end
  def self.seed_persons(*persons)
    persons.each do |person|
      Person.find_or_create_by(name: person)
    end
  end
end