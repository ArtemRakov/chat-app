class Team::Channel < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, unique: true

  has_many :messages, dependent: :destroy
  has_many :channel_members, dependent: :destroy
  has_many :users, through: :channel_members
  belongs_to :team

  def to_s
    name
  end
end
