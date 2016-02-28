
class VerbCreator
  def create(options)
    initialize_variables(options)
    create_whole_verb
  end

  private

  def initialize_variables(options)
    @conjugations = options[:conjugations]
    @source_language = options.fetch(:source_language, 'en')
    @target_language = options.fetch(:target_language, 'cz')
    @verbal_aspect = options.fetch(:verbal_aspect, 'perfective')
  end

  def create_whole_verb
    create_parent_verb
    create_all_verb_pairs
  end

  def create_parent_verb
    @parent_verb = Verb.create(verbal_aspect: find_verbal_aspect)
  end

  def create_all_verb_pairs
    form_person_map.each_key do |form_name|
      create_verb_pair(form_name)
    end
  end

  def create_verb_pair(form_name)
    verb_pair = ConjugatedVerbPair.create(verb: @parent_verb)
    ConjugatedVerbPairing.create(conjugated_verb: conjugation_for_target_language(form_name), conjugated_verb_pair: verb_pair)
    ConjugatedVerbPairing.create(conjugated_verb: conjugation_for_source_language(form_name), conjugated_verb_pair: verb_pair)
  end

  def find_verbal_aspect
    VerbalAspect.where(name: @verbal_aspect).first
  end

  def conjugation_for_source_language(form_name)
    create_conjugated_verb(form_name, @source_language)
  end

  def conjugation_for_target_language(form_name)
    create_conjugated_verb(form_name, @target_language)
  end

  def create_conjugated_verb(form_name, language)
    ConjugatedVerb.create(form_person_map[form_name].merge(
                            language: language_record(language),
                            conjugation: get_conjugation(language, form_name)))
  end

  def language_record(language)
    Language.where(abbreviation: language).first
  end

  def create_conjugated_pair(form_name)
    [
      conjugation_for_source_language(form_name),
      conjugation_for_target_language(form_name)
    ]
  end

  def get_conjugation(language, form_name)
    @conjugations[language.to_sym][form_name]
  end

  def form_person_map
    {
      infinitive: {
        form: Form.where(name: 'infinitive').first
      },
      first_s: {
        form: Form.where(name: 'present').first,
        # person: Person.where(name: 'first singular').first
      },
      second_s: {
        form: Form.where(name: 'present').first,
        person: Person.where(name: 'second singular').first
      },
      third_s: {
        form: Form.where(name: 'present').first,
        person: Person.where(name: 'third singular').first
      },
      first_p: {
        form: Form.where(name: 'present').first,
        person: Person.where(name: 'first plural').first
      },
      second_p: {
        form: Form.where(name: 'present').first,
        person: Person.where(name: 'second plural').first
      },
      third_p: {
        form: Form.where(name: 'present').first,
        person: Person.where(name: 'third plural').first
      }
    }
  end
end