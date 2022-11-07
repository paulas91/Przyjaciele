class AddResidenceToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :residence, :string
  end
end
