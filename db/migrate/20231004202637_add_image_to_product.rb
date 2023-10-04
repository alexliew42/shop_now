class AddImageToProduct < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, :decimal, precision:5, scale:2
    add_column :products, :image, :string
  end
end
