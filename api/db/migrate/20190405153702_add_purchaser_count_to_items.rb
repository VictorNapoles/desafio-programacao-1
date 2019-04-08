class AddPurchaserCountToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :purchaser_count, :integer
  end
end
