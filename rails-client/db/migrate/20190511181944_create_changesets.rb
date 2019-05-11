class CreateChangesets < ActiveRecord::Migration[5.2]
  def change
    create_table :changesets do |t|
      t.string :user_id
      t.string :change_set

      t.timestamps
    end
  end
end
