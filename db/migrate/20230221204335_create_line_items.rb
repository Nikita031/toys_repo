class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :store_id
      t.integer :quantity, :default=>1
      t.float :store_price
      t.string :store_name
      t.float :amount

      t.timestamps
    end
  end
end
