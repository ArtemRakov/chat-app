class CreateTeamChannelMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_channel_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team_channel, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
