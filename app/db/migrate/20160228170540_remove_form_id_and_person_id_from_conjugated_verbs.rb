class RemoveFormIdAndPersonIdFromConjugatedVerbs < ActiveRecord::Migration
  def change
    remove_column :conjugated_verbs, :form_id, :int
    remove_column :conjugated_verbs, :person_id, :int
  end
end
