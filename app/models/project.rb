# frozen_string_literal: true

class Project < ApplicationRecord
  STATUS_OPTIONS = %w[ready in_progress complete rejected].freeze

  belongs_to :leader, class_name: 'User', optional: true
  has_and_belongs_to_many :users
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :status, inclusion: { in: STATUS_OPTIONS }
end
