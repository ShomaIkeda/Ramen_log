class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :shop_id, null: false
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :eated_menu, null: false
      t.text :comment, null: false
      t.string :star, null: false
      
      t.timestamps
      
    end
  end
end
