class AddScheduleddateToPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :scheduled_date, :time
  end
end
