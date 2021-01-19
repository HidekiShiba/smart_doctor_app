class CreateCongestions < ActiveRecord::Migration[5.2]
  def change
    create_table :congestions do |t|
      t.integer :count, null: false
      t.integer :time,  null: false

      t.timestamps
    end
  end
end
