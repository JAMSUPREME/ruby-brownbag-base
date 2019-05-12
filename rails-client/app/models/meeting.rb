class Meeting < ApplicationRecord

  before_destroy :remove_changesets

  # Kill all the changesets
  # We will later explore tombstones as an alternative
  def remove_changesets
    Changeset.where(:meeting_id => id).destroy_all
  end
end
