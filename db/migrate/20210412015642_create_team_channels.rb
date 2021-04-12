# frozen_string_literal: true

class CreateTeamChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :team_channels do |t|
      t.string :name
      t.string :slug
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end

    add_index :team_channels, :slug, unique: true
  end
end
