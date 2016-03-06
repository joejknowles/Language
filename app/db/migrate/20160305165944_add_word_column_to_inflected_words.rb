class AddWordColumnToInflectedWords < ActiveRecord::Migration
  def change
    add_column :inflected_words, :word, :string
  end
end
