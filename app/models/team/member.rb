class Team::Member < ApplicationRecord
  belongs_to :user
  belongs_to :team
end
