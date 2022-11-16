# frozen_string_literal: true

FactoryBot.define do
  factory :friend do
    first_name { Faker::Lorem.word }
    last_name { Faker::Lorem.characters(number: 4) }
    email { 'paulina@gmail.com' }
    residence { 'Kraków' }
    cognition { :school }
  end
end
