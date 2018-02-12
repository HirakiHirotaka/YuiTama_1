class AddIntroductionToUtinaantyu < ActiveRecord::Migration[5.1]
  def change
    add_column :utinaantyus, :introduction, :string
  end
end
