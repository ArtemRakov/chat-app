# frozen_string_literal: true

class AddOwnerToTeam < ActiveRecord::Migration[6.1]
  def change
    add_reference :teams, :owner, null: false
  end
end
