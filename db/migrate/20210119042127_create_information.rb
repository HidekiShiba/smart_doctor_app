class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.integer :theme_id, null: false
      t.string :subject,   null: false, default: ""
      t.string :image_id,  null: false
      t.text :body,        null: false

      t.timestamps
    end
  end
end
