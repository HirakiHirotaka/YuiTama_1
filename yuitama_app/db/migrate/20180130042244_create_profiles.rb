class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :introduction
      t.string :specialty

      t.timestamps
    end
  end
end
