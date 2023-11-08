class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integre :genre_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integre :size_sutra, null: false
      t.integre :size_length, null: false
      t.integre :price_tax_excluded, null: false
      t.boolean :is_on_sale, null: false, default: true

      t.timestamps
    end
  end
end
