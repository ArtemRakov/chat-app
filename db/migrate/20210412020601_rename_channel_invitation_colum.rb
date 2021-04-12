class RenameChannelInvitationColum < ActiveRecord::Migration[6.1]
  def change
    rename_column :team_channel_members, :team_channel_id, :channel_id
  end
end
