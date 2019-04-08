class ChangeColumnNameProductNameToDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :name, :description
  end
end
