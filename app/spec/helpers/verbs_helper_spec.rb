require 'rails_helper'
require 'test_helpers/verb_tests_helper'

RSpec.describe VerbsHelper, type: :helper do
  it 'returns all verbs' do
    VerbTestsHelper.create_verb_to_be
    expect(subject.get_verbs.length).to eq 1
  end
end
