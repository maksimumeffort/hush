class AddUserToActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :user, null: false, foreign_key: true
  end
end
