# frozen_string_literal: true

class AddFriendToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :user_id, :integer
    add_foreign_key :friends, :users, column: :user_id
  end
end
