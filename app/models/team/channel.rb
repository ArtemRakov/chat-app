# frozen_string_literal: true

class Team::Channel < ApplicationRecord
  DEFAULT = 'general'

  validates :slug, presence: true, uniqueness: { scope: :team }

  has_many :messages, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :users, through: :channel_members
  belongs_to :team

  def to_s
    name
  end
end
