class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :subjects, :defnition, :definition
  end
end
