class AddMtgIdToChangeset < ActiveRecord::Migration[5.2]
  def change
    add_column :changesets, :meeting_id, :string
  end
end
