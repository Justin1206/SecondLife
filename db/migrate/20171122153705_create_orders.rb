class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :conversation, foreign_key: true
      t.integer :buyller_id
      t.integer :seller_id
      t.references :item, foreign_key: true
      t.string :meettime
      t.string :meetplace
      t.text :note
      t.integer :status

      t.timestamps
    end
  end
end
