class AddUserToAvailabilities < ActiveRecord::Migration[8.0]
  def change
    add_reference :availabilities, :user, null: false, foreign_key: true
  end
end
