class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :duration
      t.datetime :start_time
      t.datetime :finish_time
      t.string :description
      t.string :requirements

      t.timestamps
    end
  end
end
