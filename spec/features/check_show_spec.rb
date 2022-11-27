# frozen_string_literal: true

describe 'check show' do
  let(:user) { create(:user) }
  let(:friend) { create(:friend, user:) }

  before do
    login_as user
    friend
    visit '/'
  end

  it ' check_show ' do
    find(:link, href: "/friends/#{friend.id}").click
    expect(page).to have_content(friend.full_name)
  end
end
