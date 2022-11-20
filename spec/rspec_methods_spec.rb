# frozen_string_literal: true

describe Friend do
  it 'creates friend with atributes' do
    friend = described_class.create(first_name: 'Ola',
                                    last_name: 'Lola',
                                    residence: 'Kraków',
                                    cognition: described_class.cognitions[:school])
    expect(friend.first_name).to eq 'Ola'
  end

  context 'when first name not passed' do
    it 'does not create friend' do
      friend = described_class.create(first_name: '',
                                      last_name: 'Lola',
                                      residence: 'Kraków',
                                      cognition: described_class.cognitions[:school])
      expect(described_class.count).to eq 0
    end
  end

  it 'is not valid' do
    friend = described_class.new(first_name: '')
    expect(friend.valid?).to eq false
  end
end
