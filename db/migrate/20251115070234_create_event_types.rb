class CreateEventTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :event_types do |t|
      t.string :name, null: false
      t.text :description
      t.integer :duration_minutes, null: false
      t.integer :buffer_before_minutes
      t.integer :buffer_after_minutes
      t.boolean :active, null: false
      t.string :location_type, null: false

      t.timestamps
    end
  end
end
