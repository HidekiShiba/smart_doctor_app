class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :patient_id,         null: false
      t.datetime :date_time,         null: false
      t.integer :examination_count,  null: false, default: ""
      t.string :symptom,             null: false, default: ""
      t.string :body_parts,          null: false, default: ""
      t.date :starting_point,        null: false
      t.integer :treatment,          null: false, default: ""
      t.string :prescription,                     default: ""
      t.integer :side_effect,        null: false, default: ""
      t.string :other_diseases,                   default: ""
      t.string :hospital_name,                    default: ""
      t.integer :pregnancy,          null: false, default: ""
      t.integer :purpose,            null: false, default: ""
      t.string :request,                          default: ""
      t.integer :examination_status, null: false, default: 0
      
      t.timestamps
    end
  end
end
