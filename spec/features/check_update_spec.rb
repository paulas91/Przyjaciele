# frozen_string_literal: true

describe 'Update friend' do
  let(:user) { create(:user) }
  let(:friend) { create(:friend, user: user) }
  let(:new_attributes) { attributes_for(:friend) }

  before do
    login_as user
    friend
    visit "/friends/#{friend.id}"
  end

  it 'update friend' do
    expect(page).to have_content(friend.residence)
    click_link 'Edit this friend'

    expect(page).to have_content('Editing friend')
    fill_in 'friend_first_name',	with: new_attributes[:first_name]
    fill_in 'friend_last_name',	with: new_attributes[:last_name]
    fill_in 'friend_email',	with: new_attributes[:email]
    fill_in 'friend_residence', with: new_attributes[:residence]
    select 'party', from: 'friend[cognition]'
    click_button 'Update Friend'

    expect(page).to have_content('Friend was successfully updated.')

    email = page.find('#email').text
    residence = page.find('#residence').text
    cognition = page.find('#cognition').text
    expect(find('h5')).to have_content("#{new_attributes[:last_name]} #{new_attributes[:first_name]}")
    expect(email).to eq "email: #{new_attributes[:email]}"
    expect(residence).to eq "residence: #{new_attributes[:residence]}"
    expect(cognition).to eq 'cognition: party'
    click_link 'Back to friends'

    expect(page).to have_content("#{new_attributes[:last_name]} #{new_attributes[:first_name]}")
    expect(page).to have_content('party')
  end
end
