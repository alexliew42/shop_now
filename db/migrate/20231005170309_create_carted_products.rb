class CreateCartedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :carted_products do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
