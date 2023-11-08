class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integre :customer_id, null: false
      t.integre :item_id, null: false
      t.integre :amount, null: false

      t.timestamps
    end
  end
end
