class AddPersonIdToVerbConjugation < ActiveRecord::Migration
  def change
    add_reference :conjugated_verbs, :person, index: true, foreign_key: true
  end
end
