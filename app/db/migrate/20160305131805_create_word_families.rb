class CreateWordFamilies < ActiveRecord::Migration
  def change
    create_table :word_families do |t|
      t.belongs_to :word_class, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
