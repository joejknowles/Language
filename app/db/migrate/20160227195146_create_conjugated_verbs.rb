class CreateConjugatedVerbs < ActiveRecord::Migration
  def change
    create_table :conjugated_verbs do |t|
      t.belongs_to :form, index: true, foreign_key: true
      t.belongs_to :language, index: true, foreign_key: true
      t.string :conjugation

      t.timestamps null: false
    end
  end
end
