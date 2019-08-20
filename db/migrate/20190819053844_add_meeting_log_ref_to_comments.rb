class AddMeetingLogRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :meeting_log, foreign_key: true
  end
end
