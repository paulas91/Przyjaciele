# frozen_string_literal: true

def full_name(last_name, first_name)
  "#{last_name} #{first_name}"
end

describe 'test method' do
  it 'returns full name' do
    expect(full_name('Kowalski', 'Jan')).to eq 'Kowalski Jan'
  end
end
