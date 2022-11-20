# frozen_string_literal: true

describe 'Add new friend' do
  before do
    visit '/'
  end

  it 'adds a new friend' do
    click_link 'New friend'
    expect(page).to have_content('New friend')

    fill_in 'friend_first_name',	with: 'Oliwka'
    fill_in 'friend_last_name',	with: 'Oliwna'
    fill_in 'friend_email',	with: 'oliwka@gmail.com'
    fill_in 'friend_residence',	with: 'Kos'
    select 'holiday', from: 'friend[cognition]'
    click_button 'Create Friend'

    expect(page).to have_content('Friend was successfully created.')
    email = page.find('#email').text
    residence = page.find('#residence').text
    cognition = page.find('#cognition').text
    expect(find('h5')).to have_content('Oliwna Oliwka')
    expect(email).to eq 'email: oliwka@gmail.com'
    expect(residence).to eq 'residence: Kos'
    expect(cognition).to eq 'cognition: holiday'
    # items = all('.list-group-item')
    # expect(items[0]).to have_content('email: oliwka@gmail.com')
    # expect(items[1]).to have_content('residence: Kos')
    # expect(items[2]).to have_content('cognition: holiday')

    click_link 'Back to friends'
    expect(page).to have_content('Oliwna Oliwka')
    expect(page).to have_content('holiday')
  end
end
