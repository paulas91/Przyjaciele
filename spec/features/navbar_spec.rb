# frozen_string_literal: true

describe 'Navbar' do
  let(:user) { create(:user) }

  before do
    login_as user
    visit '/'
  end

  it 'has link to All friends' do
    expect(page).to have_link('All')
  end

  it 'has link to friends met at school' do
    expect(page).to have_link('School')
  end

  it 'has link to friends met at work' do
    expect(page).to have_link('Work')
  end

  it 'has link to friends met on holiday' do
    expect(page).to have_link('Holiday')
  end

  it 'has link to friends met at the party' do
    expect(page).to have_link('Party')
  end
end
