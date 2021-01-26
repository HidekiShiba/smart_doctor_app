class AddUpdateStatusToExaminations < ActiveRecord::Migration[5.2]
  def change
    add_column :examinations, :update_status, :integer, default: 0, null: false
  end
end
