# frozen_string_literal: true

describe Friend, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:residence).of_type(:string) }
    it { is_expected.to have_db_column(:cognition).of_type(:integer) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:residence) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to have_db_index(:email).unique(true) }
    it { is_expected.to allow_value('paulina@gmail.com').for(:email).with_message('format is incorect') }
    it { is_expected.to define_enum_for(:cognition).with_values(described_class.cognitions) }
  end
end
