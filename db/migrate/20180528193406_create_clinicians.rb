class CreateClinicians < ActiveRecord::Migration[5.1]
  def change
    create_table :clinicians, id: false do |t|
    	t.primary_key :id
    	t.string :first_name
    	t.string :last_name
    	t.integer :clinic
    	t.integer :target_patients_per_day
    	t.integer :days_working
      t.string :specialty_1
      t.string :specialty_2
      t.string :specialty_3
    end
  end
end
