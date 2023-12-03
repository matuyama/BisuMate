class CreateGenreRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_relations do |t|
      t.references :item, foreign_key: true, null: false
      t.references :genre, foreign_key: true, null: false

      t.timestamps
    end
  end
end
