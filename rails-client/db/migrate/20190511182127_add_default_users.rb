class AddDefaultUsers < ActiveRecord::Migration[5.2]
  def up
    # Make some default people
    User.create(first_name: "Default", last_name: 'Person')
    User.create(first_name: "Dr", last_name: 'Doom')
    User.create(first_name: "Captain", last_name: 'Marvel')
  end

  def down
    User.destroy_all
  end
end
