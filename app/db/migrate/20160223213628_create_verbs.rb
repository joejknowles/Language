class CreateVerbs < ActiveRecord::Migration
  def change
    create_table :verbs do |t|
      t.string :cz_infinitive
      t.string :en_infinitive

      t.timestamps null: false
    end
  end
end
