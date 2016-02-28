class CreateConjugatedVerbPairings < ActiveRecord::Migration
  def change
    create_table :conjugated_verb_pairings do |t|
      t.belongs_to :conjugated_verb, index: true, foreign_key: true
      t.belongs_to :conjugated_verb_pair, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
