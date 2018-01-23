class AddPlanIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :plan_id, :integer
  end
end
