class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integre :customer_id, null: false
      t.string :name, null: false
      t.integre :billing_price, null: false
      t.integre :payment_method, null: false, default: 0
      t.integre :postage, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integre :status, null: false, default: 0

      t.timestamps
    end
  end
end
