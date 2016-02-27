require 'rails_helper'
require 'test_helpers/verb_tests_helper'

feature 'verbs, ' do
  context 'when no verbs have been added' do
    scenario 'should display a prompt to add verbs' do
      visit '/verbs'
      expect(page).to have_content 'No verbs yet'
      expect(page).to have_link 'Add a verb'
    end
  end

  context 'when verbs have been added' do
    before do
      VerbTestsHelper.create_verbal_aspects
      VerbTestsHelper.create_verb_to_be
    end
    scenario 'should ask for a translation verbs' do
      visit '/verbs'
      expect(page).to have_content(
        """
        být to be
        jsem am
        jsi are
        je is
        jsme are
        jste are
        jsou are
        """)
    end
  end
end