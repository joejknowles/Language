class CreateInflectedWords < ActiveRecord::Migration
  def change
    create_table :inflected_words do |t|
      t.belongs_to :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
