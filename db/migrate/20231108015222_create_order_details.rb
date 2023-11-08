class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integre :order_id, null: false
      t.integre :item_id, null:false
      t.integre :amount, null: false
      t.integre :price_tax_included, null: false
      t.integre :status, null: false, default: 0

      t.timestamps
    end
  end
end
