class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :genre_id, null: false
      t.integer :shop_id, null: false
      t.string :menu, null: false

      t.timestamps
    end
  end
end
