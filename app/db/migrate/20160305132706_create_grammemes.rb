class CreateGrammemes < ActiveRecord::Migration
  def change
    create_table :grammemes do |t|
      t.belongs_to :grammatical_category, index: true, foreign_key: true
      t.string :grammeme_name

      t.timestamps null: false
    end
  end
end
