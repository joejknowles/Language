class CreateEquivalentInflectedWordsGroupings < ActiveRecord::Migration
  def change
    create_table :inflected_words_groupings do |t|
      t.belongs_to :inflected_words_group, index: true, foreign_key: true
      t.belongs_to :inflected_word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
