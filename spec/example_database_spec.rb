# frozen_string_literal: true

describe 'example database' do
  it 'creates friend' do
    Friend.create(first_name: 'Oliwka', last_name: 'dgiwgid', email: 'dhgugu@gmail.com', residence: 'oniwow')
    expect(Friend.count).to eq 1
  end
end
