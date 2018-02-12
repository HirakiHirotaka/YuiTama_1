class AddUserBookedplanId < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bookedplan_id, :integer
  end
end
