class AddImageToPlates < ActiveRecord::Migration[7.0]
  def change
    add_column :plates, :image, :string
  end
end
