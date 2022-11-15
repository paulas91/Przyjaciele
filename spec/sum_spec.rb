# frozen_string_literal: true

def sum(number_1, number_2)
  number_1 + number_2
end

describe 'test sum' do
  it 'returns sum' do
    expect(sum(1, 2)).to eq 3
  end
end
