require 'rails_helper'
require 'test_helpers/verb_tests_helper'

feature 'viewing verbs, ' do
  context 'when no verbs have been added' do
    scenario 'should display a prompt to add verbs' do
      visit '/verbs'
      expect(page).to have_content 'No verbs yet'
      expect(page).to have_link 'Add a verb'
    end
  end

  context 'when verbs have been added' do
    before do
      VerbsHelper.add_verb_database_dependencies
      VerbsHelper.create_to_be
    end
    scenario 'should show table of verbs' do
      visit '/verbs'
      expect(page).to have_content(
        """
        to be být
        am jsem
        are jsi
        is je
        are jsme
        are jste
        are jsou
        """)
    end
  end
end