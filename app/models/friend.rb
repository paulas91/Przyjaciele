# frozen_string_literal: true

class Friend < ApplicationRecord
  validates :first_name, :last_name, :email, :residence, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w\.\-]+[@]\w+[.][a-zA-Z]{2,4}\z/,
  message: "format is incorect" }
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
