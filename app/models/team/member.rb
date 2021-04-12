# frozen_string_literal: true

module Team
  class Member < ApplicationRecord
    belongs_to :user
    belongs_to :team
  end
end
