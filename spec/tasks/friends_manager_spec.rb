# frozen_string_literal: true

require_relative '../../lib/friends_manager'

describe FriendsManager do
  subject(:manager) { described_class.new }

  let!(:friends) { create_list(:friend, 5) }
  let(:user) { create(:user) }

  it 'fixes friends and users association' do
    manager.fix_friends_and_users_associations(user)
    friends.each do |friend|
      expect(friend.reload.user).to eq user
    end
  end
end
