# frozen_string_literal: true

# == Schema Information
#
# Table name: friends
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  residence  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_friends_on_email  (email) UNIQUE
#
class Friend < ApplicationRecord
  validates :first_name, :last_name, :email, :residence, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w\.\-]+[@]\w+[.][a-zA-Z]{2,4}\z/,
  message: "format is incorect" }
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
