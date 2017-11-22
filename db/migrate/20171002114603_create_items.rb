class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :status
      t.integer :amount
      t.integer :price
      t.string :picture
      t.string :category
      t.boolean :status

      t.timestamps
    end
  end
end
