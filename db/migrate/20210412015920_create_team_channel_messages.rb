class CreateTeamChannelMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :team_channel_messages do |t|
      t.references :team_channel, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
