class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.string :invite_name, null: false
      t.string :invite_email, null: false
      t.string :invite_phone, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :booking_source, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
