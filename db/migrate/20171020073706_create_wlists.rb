class CreateWlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wlists do |t|
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
