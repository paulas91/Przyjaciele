# frozen_string_literal: true

describe Friend, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:residence).of_type(:string) }
    it { is_expected.to have_db_column(:cognition).of_type(:integer) }
  end
end
