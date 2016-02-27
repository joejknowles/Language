class AddVerbalAspectIdToVerb < ActiveRecord::Migration
  def change
    add_reference :verbs, :verbal_aspect, index: true, foreign_key: true
  end
end
