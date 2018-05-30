require 'csv'
require 'date'

namespace :import_data do

	desc "Import clinicians from csv"
	task clinicians: :environment do
		filename = File.join Rails.root, "/lib/seeds/clinicians.csv"
		counter = 0
		CSV.foreach(filename, headers: true) do |row|
			clinician = Clinician.create(id: row["id"].to_i, first_name: row["first_name"], last_name: row["last_name"], clinic: row["clinic"].to_i, target_patients_per_day: row["target_patients_per_day"].to_i, days_working: row["days_working"].to_i, specialty_1: row["specialty_1"], specialty_2: row["specialty_2"], specialty_3: row["specialty_3"])
			counter += 1 if clinician.persisted?
		end
		puts "#{counter} clinician instances created."
	end

	desc "Import appointments from csv files"
	task appointments: :environment do
		filename1 = File.join Rails.root, "/lib/seeds/appointments_1.csv"
		filename2 = File.join Rails.root, "/lib/seeds/appointments_2.csv"
		counter = 0

		CSV.foreach(filename1, headers: true) do |row|
			appointment = Appointment.create(patient_id: row["patient_id"].to_i, clinician_id: row["clinician_id"].to_i, date_scheduled: DateTime.parse(row["date_scheduled"]), date_of_service: DateTime.parse(row["date_of_service"]), canceled: row["canceled"].to_i, no_show: row["no_show"].to_i, clinic: row["clinic"].to_i)
			counter += 1 if appointment.persisted?
		end

		CSV.foreach(filename2, headers: true) do |row|
			appointment = Appointment.create(patient_id: row["patient_id"].to_i, clinician_id: row["clinician_id"].to_i, date_scheduled: DateTime.parse(row["date_scheduled"]), date_of_service: DateTime.parse(row["date_of_service"]), canceled: row["canceled"].to_i, no_show: row["no_show"].to_i, clinic: row["clinic"].to_i)
			counter += 1 if appointment.persisted?
		end
		puts "#{counter} appointment instances created."
	end

	desc "Import patients from csv file"
	task patients: :environment do
		filename = File.join Rails.root, "/lib/seeds/patients.csv"
		counter = 0

		CSV.foreach(filename, headers: true) do |row|
			patient = Patient.create(id: row["id"], first_name: row["first_name"], last_name: row["last_name"], address: row["address"], email: row["email"], referral_channel: row["referral_channel"], diagnosis: row["diagnosis"], primary_clinician: row["primary_clinician"].to_i)
			counter += 1 if patient.persisted?
		end
		puts "#{counter} patient instances created"
	end
end