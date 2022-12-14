# frozen_string_literal: true

FactoryBot.define do
  factory :friend do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    residence { Faker::Address.city }
    cognition { :school }
  end
end
