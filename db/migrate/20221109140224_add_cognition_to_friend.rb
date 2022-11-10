# frozen_string_literal: true

class AddCognitionToFriend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :cognition, :integer, null: false, default: Friend.cognitions[:other]
  end
end
