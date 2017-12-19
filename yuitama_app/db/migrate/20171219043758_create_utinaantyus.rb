class CreateUtinaantyus < ActiveRecord::Migration[5.1]
  def change
    create_table :utinaantyus do |t|
      t.string :name
      t.integer :age
      t.string :mailaddress

      t.timestamps
    end
  end
end
