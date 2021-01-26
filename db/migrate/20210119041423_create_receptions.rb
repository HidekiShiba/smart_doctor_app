class CreateReceptions < ActiveRecord::Migration[5.2]
  def change
    create_table :receptions do |t|
      t.integer :patient_id,         null: false
      t.integer :congestion_id,      null: false
      t.integer :number,             null: false
      t.datetime :start_time,        null: false
      t.integer :examination_status, null: false, default: 0

      t.timestamps
    end
  end
end
