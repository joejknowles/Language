class CreateWordGrammemes < ActiveRecord::Migration
  def change
    create_table :word_grammemes do |t|
      t.belongs_to :grammeme, index: true, foreign_key: true
      t.belongs_to :inflected_word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
