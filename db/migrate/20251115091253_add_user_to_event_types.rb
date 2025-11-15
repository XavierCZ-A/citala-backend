class AddUserToEventTypes < ActiveRecord::Migration[8.0]
  def change
    add_reference :event_types, :user, null: false, foreign_key: true
  end
end
