class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :location
      t.datetime :time
      t.string :description
      t.string :purpose
      t.integer :max_attendees

      t.timestamps
    end
  end
end
