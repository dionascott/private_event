class CreateEventAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :event_attendances, id: false do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
