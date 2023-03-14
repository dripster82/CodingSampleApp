# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'MyText' }
    project { nil }
    user { nil }
  end
end
