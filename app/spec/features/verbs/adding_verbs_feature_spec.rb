require 'rails_helper'
require 'test_helpers/verb_tests_helper'

feature 'creating verbs, ' do
  context 'when adding a verb' do
    before do
      VerbTestsHelper.add_verb_database_dependencies
      visit '/verbs'
      click_link 'Add a verb'
    end
    scenario 'should  see input for infinitive verb for' do
      expect(page).to have_field(
        'word_family_inflected_words_groups_attributes_5_inflected_words_attributes_1_word')
    end
    scenario 'should reject empty fields' do
      click_button 'submit verb'
      expect(page).to have_content('Please fill in all fields')
    end
    scenario 'should accept correctly filled form' do
      all('.English input').first.set 'to have'
      fill_in 'word_family_inflected_words_groups_attributes_0_inflected_words_attributes_0_word', with: 'to have'
      fill_in 'word_family_inflected_words_groups_attributes_0_inflected_words_attributes_1_word', with: 'to have'

      fill_in 'word_family_inflected_words_groups_attributes_1_inflected_words_attributes_0_word', with: 'to have'
      fill_in 'word_family_inflected_words_groups_attributes_1_inflected_words_attributes_1_word', with: 'to have'

      fill_in 'word_family_inflected_words_groups_attributes_2_inflected_words_attributes_0_word', with: 'to have'
      fill_in 'word_family_inflected_words_groups_attributes_2_inflected_words_attributes_1_word', with: 'to have'

      fill_in 'word_family_inflected_words_groups_attributes_3_inflected_words_attributes_0_word', with: 'to have'
      fill_in 'word_family_inflected_words_groups_attributes_3_inflected_words_attributes_1_word', with: 'to have'

      fill_in 'word_family_inflected_words_groups_attributes_4_inflected_words_attributes_0_word', with: 'to have'
      fill_in 'word_family_inflected_words_groups_attributes_4_inflected_words_attributes_1_word', with: 'to have'

      fill_in 'word_family_inflected_words_groups_attributes_5_inflected_words_attributes_0_word', with: 'to have'
      fill_in 'word_family_inflected_words_groups_attributes_5_inflected_words_attributes_1_word', with: 'to have'

      fill_in 'word_family_inflected_words_groups_attributes_6_inflected_words_attributes_0_word', with: 'to have'
      fill_in 'word_family_inflected_words_groups_attributes_6_inflected_words_attributes_1_word', with: 'to have'
      click_button 'submit verb'
      expect(page).to have_content("word successfully added")
    end
  end
end