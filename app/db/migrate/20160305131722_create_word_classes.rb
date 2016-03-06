class CreateWordClasses < ActiveRecord::Migration
  def change
    create_table :word_classes do |t|
      t.string :word_class_name

      t.timestamps null: false
    end
  end
end
