class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :size_sutra, null: false, default: 0
      t.integer :size_length, null: false, default: 0
      t.integer :stock, nill: false, default: 0
      t.integer :price_tax_excluded, null: false
      t.boolean :is_on_sale, null: false, default: true

      t.timestamps
    end
  end
end
