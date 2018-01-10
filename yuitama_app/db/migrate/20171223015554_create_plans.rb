class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.text :content
      t.binary :image
      t.integer :creator_id

      t.timestamps
    end
  end
end
