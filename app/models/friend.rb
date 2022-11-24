# frozen_string_literal: true

# == Schema Information
#
# Table name: friends
#
#  id         :bigint           not null, primary key
#  cognition  :integer          default("other"), not null
#  email      :string
#  first_name :string
#  last_name  :string
#  residence  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_friends_on_email  (email) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Friend < ApplicationRecord
  validates :first_name, :last_name, :email, :residence, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w.\-]+@\w+[.][a-zA-Z]{2,4}\z/,
                              message: 'format is incorect' }

  enum cognition: { school: 0, work: 1, holiday: 2, party: 3, other: 4 }
  validates :cognition, inclusion: { in: cognitions.keys }
  scope :display_order, -> { order(:last_name) }
  scope :with_cognition, ->(cognition) { where(cognition: cognitions[cognition]) }
  belongs_to :user
  def full_name
    "#{last_name} #{first_name}"
  end
end
