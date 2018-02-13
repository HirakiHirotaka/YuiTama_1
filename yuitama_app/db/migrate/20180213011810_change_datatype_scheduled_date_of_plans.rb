class ChangeDatatypeScheduledDateOfPlans < ActiveRecord::Migration[5.1]
  def change
    change_column :plans, :scheduled_date, :datetime
  end
end
