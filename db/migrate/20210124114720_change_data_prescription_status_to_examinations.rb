class ChangeDataPrescriptionStatusToExaminations < ActiveRecord::Migration[5.2]
  def up
    change_column :examinations, :prescription_status, :integer
  end
end
