class CreateConjugatedVerbPairs < ActiveRecord::Migration
  def change
    create_table :conjugated_verb_pairs do |t|
      t.belongs_to :verb, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
