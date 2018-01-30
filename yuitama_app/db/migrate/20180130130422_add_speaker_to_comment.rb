class AddSpeakerToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :speaker_id, :integer
  end
end
