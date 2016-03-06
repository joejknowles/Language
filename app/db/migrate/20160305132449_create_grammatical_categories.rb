class CreateGrammaticalCategories < ActiveRecord::Migration
  def change
    create_table :grammatical_categories do |t|
      t.string :grammatical_category_name

      t.timestamps null: false
    end
  end
end
