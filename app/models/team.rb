# frozen_string_literal: true

class Team < ApplicationRecord
  validates :slug, uniqueness: true, presence: true
  validates :name, presence: true

  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :channels, dependent: :destroy

  belongs_to :owner, class_name: 'User'

  def to_s
    name
  end

  def guest?(user)
    users.exclude?(user)
  end
end
