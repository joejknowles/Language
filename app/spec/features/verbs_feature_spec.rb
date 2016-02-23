require 'rails_helper'

feature 'verbs' do
  context 'no verbs have been added' do
    scenario 'should display a prompt to add verbs'
      visit '/verbs'
      expect(page).to have_content 'No verbs yet'
      expect(page).to have_link 'Add a verb'
    end
  end
end