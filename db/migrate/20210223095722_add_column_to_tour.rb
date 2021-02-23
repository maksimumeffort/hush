class AddColumnToTour < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :public, :boolean, default: false
  end
end
