class ChangeColumnToMeetingLog < ActiveRecord::Migration[5.2]
  def up
    change_column :meeting_logs, :day, :date, null: false, default: Date.today-1
  end

  def down
    change_column :meeting_logs, :day, :date, null: false
  end
end
