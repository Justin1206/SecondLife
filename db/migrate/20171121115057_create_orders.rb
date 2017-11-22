class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :meettime
      t.string :meetplace
      t.text :note
      t.integer :item_id
      t.integer :seller_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
