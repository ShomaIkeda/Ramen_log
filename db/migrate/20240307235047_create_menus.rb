class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :genre_id, null: false
      t.integer :shop_id, null: false
      t.string :name, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
