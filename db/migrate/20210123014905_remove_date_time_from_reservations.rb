class RemoveDateTimeFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :date_time, :datetime
  end
end
