class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false
      t.string :address, null: false
      t.string :telephone_number, null: false
      t.string :opening_time, null: false
      t.string :holiday, null: false

      t.timestamps
    end
  end
end
