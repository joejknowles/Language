require 'verb_creator'
require 'verb_builder'
module VerbsHelper
  def self.all_verbs
    WordFamily.all_verbs
  end

  def self.create_to_be
    verb_creator = VerbCreator.new
    verb_creator.create_to_be
  end

  def self.new_word(params, flash)
    VerbBuilder.new_word(params, flash)
  end

  def self.add_verb_database_dependencies
    add_languages
    add_verb_word_class
    add_grammatical_categories
    add_grammemes
  end

  private

  def self.add_languages
    %w(English Czech).each do |language_name|
      Language.find_or_create_by(language_name: language_name)
    end
  end

  def self.add_verb_word_class
    WordClass.find_or_create_by(word_class_name: 'verb')
  end

  def self.add_grammatical_categories
    %w(finitude person).each do |category_name|
      GrammaticalCategory.find_or_create_by(grammatical_category_name: category_name)
    end
  end

  def self.add_grammemes
    add_infinitive
    add_persons
  end

  def self.add_persons
    person_category = GrammaticalCategory.find_by(
      grammatical_category_name: 'person')
    %w(singular plural).each do |plurality|
      %w(first second third).each do |person|
        Grammeme.find_or_create_by(
          grammeme_name: person + ' person ' << plurality,
          grammatical_category: person_category)
      end
    end
  end

  def self.add_infinitive
    finitude_category = GrammaticalCategory.find_by(
      grammatical_category_name: 'finitude')
    Grammeme.find_or_create_by(
      grammeme_name: 'infinitive',
      grammatical_category: finitude_category)
  end
end