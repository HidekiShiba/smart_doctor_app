class CreateExaminations < ActiveRecord::Migration[5.2]
  def change
    create_table :examinations do |t|
      t.integer :reservation_id
      t.integer :reception_id
      t.string :diagnosis,            null: false, default: ""
      t.string :treatment,            null: false, default: ""
      t.integer :prescription_status, null: false
      t.string :prescription_status,               default: ""

      t.timestamps
    end
  end
end
