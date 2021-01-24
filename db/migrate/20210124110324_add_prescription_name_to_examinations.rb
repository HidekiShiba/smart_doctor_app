class AddPrescriptionNameToExaminations < ActiveRecord::Migration[5.2]
  def change
    add_column :examinations, :prescription_name, :string
  end
end
