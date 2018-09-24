class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :defnition
      t.integer :tutorial_id

      t.timestamps
    end
  end
end
