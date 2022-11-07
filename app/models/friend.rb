# frozen_string_literal: true

class Friend < ApplicationRecord
  def full_name
    "#{first_name} #{last_name}"
  end
end
