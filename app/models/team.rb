class Team < ApplicationRecord
  validates :slug, unique: true, presence: true
  validates :name, presence: true


  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_invitations
  has_many :channels, dependent: :destroy

  belongs_to :owner, class_name: "User"
end
