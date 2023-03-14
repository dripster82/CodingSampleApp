# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :leader, class_name: 'User'
  has_and_belongs_to_many :users
  has_many :comments, dependent: :destroy
end
