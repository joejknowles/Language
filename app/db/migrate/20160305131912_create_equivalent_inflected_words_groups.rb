class CreateEquivalentInflectedWordsGroups < ActiveRecord::Migration
  def change
    create_table :inflected_words_groups do |t|
      t.belongs_to :word_family, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
