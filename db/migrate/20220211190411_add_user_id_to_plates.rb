class AddUserIdToPlates < ActiveRecord::Migration[7.0]
  def change
    add_column :plates, :user_id, :integer
  end
end
