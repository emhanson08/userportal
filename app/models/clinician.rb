class Clinician < ApplicationRecord
	require 'date'
	has_and_belongs_to_many :patients
	has_many :appointments

	def daily_average(date)
		week = find_week(date)
		counter = 0
		appointments.find_each do |appt|
			if appt.date_of_service.to_date.between?(week[0], week[1])
				counter += 1
			end
		end
		average = counter/days_working.to_f
	end

	def find_week(date) #input date in YYYY-MM-DD format
		monday = date.to_date - ((date.to_date.wday + 1) % 7 + 5)
		return [monday.beginning_of_day, (monday + 4).end_of_day]
	end

	def most_recent_week_date
		Appointment.order(:date_of_service).where(clinician_id: self.id).last.date_of_service.to_date
	end

	def all_specialties
		specialties = []
		specialties << self.specialty_1 if self.specialty_1
		specialties << self.specialty_2 if self.specialty_2
		specialties << self.specialty_3 if self.specialty_3
		return specialties.join(", ")
	end

	def meeting_quota?
		if self.daily_average(self.most_recent_week_date) < self.target_patients_per_day
			return "No"
		else
			return "Yes"
		end
	end
end
