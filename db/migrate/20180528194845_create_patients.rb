class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients, id: false do |t|
    	t.primary_key :id
    	t.string :first_name
    	t.string :last_name
    	t.string :address
    	t.string :email
    	t.string :referral_channel
    	t.string :diagnosis
    	t.integer :primary_clinician
    end
  end
end
