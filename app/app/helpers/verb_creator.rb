
class VerbCreator
  def create(options)
    initialize_variables(options)
    create_whole_verb
  end

  private

  def initialize_variables(options)
    @conjugations = options[:conjugations]
    @source_language = options.fetch(:source_language, 'en')
    @source_language = options.fetch(:target_language, 'cz')
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
    form.each_key do |form_name|
      create_verb_pair(form_name)
    end
  end

  def create_verb_pair(form_name)
    ConjugatedVerbPair.Create(
      { verb: @parent_verb }.merge(
        create_conjugated_verbs(form_name))
    )
  end

  def find_verbal_aspect
    VerbalAspect.where(name: @verbal_aspect).first
  end

  def create_conjugated_verbs(form_name)
    source_verb = create_conjugated_verb(form_name, source_language)
    target_verb = create_conjugated_verb(form_name, target_language)
    create_conjugated_pair_hash(source_verb, target_verb)
  end

  def create_conjugated_verb(form_name, language)
    ConjugatedVerb.Create(form_id: form[form_id], language_id: language,
                          conjugation: get_conjugation(language, form_name))
  end

  def create_conjugated_pair_hash(source_verb, target_verb)
    {
      source_language_conjugated_verb: source_verb,
      target_language_conjugated_verb: target_verb
    }
  end

  def get_conjugation(language, form_name)
    conjugations[language.to_sym][form_name.to_sym]
  end

  def form
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