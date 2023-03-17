# frozen_string_literal: true

class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable

  enum role: { user: 0, moderator: 1, admin: 2 }
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end
end
