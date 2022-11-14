class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :image
      t.string :title
      t.string :category
      t.integer :price
      t.integer :actual_price
      t.integer :discount
    end
  end
end
