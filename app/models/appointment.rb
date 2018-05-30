class Appointment < ApplicationRecord
	belongs_to :clinician
	belongs_to :patient
end
