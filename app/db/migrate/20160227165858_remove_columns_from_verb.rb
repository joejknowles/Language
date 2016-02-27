class RemoveColumnsFromVerb < ActiveRecord::Migration
  def change
    remove_column :verbs, :cz_infinitive, :string
    remove_column :verbs, :en_infinitive, :string
  end
end
