class AddPublicToTour < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :public, :boolean
  end
end
