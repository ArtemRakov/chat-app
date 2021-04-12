# frozen_string_literal: true

module Team
  module Channel
    class Message < ApplicationRecord
      belongs_to :channel
      belongs_to :team
      belongs_to :user

      validates :content, presence: true
    end
  end
end
