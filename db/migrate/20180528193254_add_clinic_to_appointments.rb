class AddClinicToAppointments < ActiveRecord::Migration[5.1]
  def change
  	add_column :appointments, :clinic, :integer
  end
end
