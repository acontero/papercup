class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :name
      t.references :user_id, index: true

      t.timestamps

    end
  end
end
