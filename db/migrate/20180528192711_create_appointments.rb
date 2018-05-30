class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
    	t.integer :patient_id
    	t.integer :clinician_id
    	t.datetime :date_scheduled
    	t.datetime :date_of_service
    	t.integer :canceled
    	t.integer :no_show
    end
  end
end
