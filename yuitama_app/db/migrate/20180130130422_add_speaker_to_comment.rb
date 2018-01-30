class AddSpeakerToComment < ActiveRecord::Migration[5.1]
  def change
    add_columun :speaker_id, :integer
  end
end
