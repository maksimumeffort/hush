class RemoveBookings < ActiveRecord::Migration[6.0]
  def change
    drop_table :bookings
  end
end
 