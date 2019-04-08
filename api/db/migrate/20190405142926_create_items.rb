class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :purchaser, foreign_key: true
      t.references :product, foreign_key: true
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
