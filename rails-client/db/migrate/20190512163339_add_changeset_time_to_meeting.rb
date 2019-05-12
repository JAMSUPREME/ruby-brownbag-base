class AddChangesetTimeToMeeting < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :changeset_time, :datetime
  end
end
