# frozen_string_literal: true

describe 'check show' do
  let(:friend) { create(:friend) }

  before do
    friend
    visit '/'
  end

  it ' check_show ' do
    find(:link, href: "/friends/#{friend.id}").click
    expect(page).to have_content(friend.full_name)
  end
end
