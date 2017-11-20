class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :item, foreign_key: true
      t.integer :buyer_id
      t.integer :buyer_rating
      t.integer :seller_id
      t.integer :seller_rating
      t.string :status      
      t.string :meettime
      t.string :meetlocation
      t.text :note

      t.timestamps
    end
  end
end
