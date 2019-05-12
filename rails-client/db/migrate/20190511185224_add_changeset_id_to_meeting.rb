class AddChangesetIdToMeeting < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :changeset_id, :string
  end
end
