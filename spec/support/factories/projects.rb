# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { 'MyString' }
    code { 'MyString' }
    leader { nil }
  end
end
