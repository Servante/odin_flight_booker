class AddBookingIdToPassengers < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :booking_id, :string
  end
end
