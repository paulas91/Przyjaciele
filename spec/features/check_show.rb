# frozen_string_literal: true

describe 'check_show' do
  let(:friend) { create(:friend) }

  before do
    friend
    visit '/'
  end

  it ' check_show ' do
    save_and_open_page
    find(:link, href: "/friends/#{friend.id}").click
    expect(page).to have_content(friend.full_name)
  end
end
