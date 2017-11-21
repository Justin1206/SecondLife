class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :meettime
      t.string :meetplace
      t.text :note

      t.timestamps
    end
  end
end
