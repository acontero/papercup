class AddNotesToPrompts < ActiveRecord::Migration
  def change
    add_column :prompts, :notes, :text
  end
end
