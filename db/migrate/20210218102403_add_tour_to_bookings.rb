class AddTourToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :tour, null: false, foreign_key: true
  end
end
