class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :date
      t.string :start_time
      t.string :finish_time

      t.timestamps
    end
  end
end
