class AddTourToTours < ActiveRecord::Migration[6.0]
  def change
    add_reference :tours, :tour, null: true, foreign_key: true
  end
end
