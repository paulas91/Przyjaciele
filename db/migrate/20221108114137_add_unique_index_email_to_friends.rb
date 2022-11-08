class AddUniqueIndexEmailToFriends < ActiveRecord::Migration[7.0]

  def change
    add_index :friends, :email, unique: true
  end
end
