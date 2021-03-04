class ChangeDefaultPublic < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tours, :public, false
  end
end
