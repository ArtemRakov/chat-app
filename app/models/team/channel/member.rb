# frozen_string_literal: true

module Team
  module Channel
    class Member < ApplicationRecord
      belongs_to :user
      belongs_to :team
      belongs_to :channel, class_name: 'Team::Channel'
    end
  end
end
