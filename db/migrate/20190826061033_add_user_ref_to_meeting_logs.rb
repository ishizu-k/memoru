class AddUserRefToMeetingLogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :meeting_logs, :user, foreign_key: true
  end
end
