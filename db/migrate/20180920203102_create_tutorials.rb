class CreateTutorials < ActiveRecord::Migration[5.2]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.text :definition
      t.integer :topic_id

      t.timestamps
    end
  end
end
