class CreateMeetingLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :meeting_logs do |t|
      t.string :name, null: false, default: ""
      t.date :day, null: false, default: ""
      t.string :place, null: false, default: ""
      t.string :memo, null: false, default: ""
      t.string :how, null: false, default: ""
      t.text :image, null: false, default: ""
      t.string :position, null: false, default: ""
      t.integer :status, null: false, default: 0
      t.integer :age
      t.string :look
      t.date :birth
      t.integer :blood
      t.string :hometown
      t.string :other
      t.timestamps
    end
  end
end
