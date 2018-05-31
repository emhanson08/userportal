require 'rails_helper'
require 'date'

RSpec.describe Clinician, type: :model do
  
  describe 'daily_average' do
  	it 'given a date, should return the average number of clients seen per day over the previous week.' do
  		clinician = FactoryBot.create(:clinician, id: 1, days_working: 5)
  		patient = FactoryBot.create(:patient, id: 1)
  		appointment1 = FactoryBot.create(:appointment, clinician_id: clinician.id, patient_id: patient.id, date_of_service: "2017-03-01 08:00:00")
  		appointment2 = FactoryBot.create(:appointment, clinician_id: clinician.id, patient_id: patient.id, date_of_service: "2017-03-02 08:00:00")
  		results = clinician.daily_average("2017-03-09")
  		expect(results).to eq(0.4)
  	end
  end

  describe 'meeting_quota' do
  	it 'should return whether a clinician is meeting their target daily number of patients' do
  		clinician = FactoryBot.create(:clinician, id: 1, days_working: 5, target_patients_per_day: 5)
  		patient = FactoryBot.create(:patient, id: 1)
  		appointment1 = FactoryBot.create(:appointment, clinician_id: clinician.id, patient_id: patient.id, date_of_service: "2017-03-01 08:00:00")
  		appointment2 = FactoryBot.create(:appointment, clinician_id: clinician.id, patient_id: patient.id, date_of_service: "2017-03-02 08:00:00")
  		result = clinician.meeting_quota?
  		expect(result).to eq("No")
  	end
  end

  describe 'all_specialties' do
  	it "should return a string of all the clinicians specialties" do
  		clinician = FactoryBot.create(:clinician, id: 3, specialty_1: "Psychopathology", specialty_2: "OCD", specialty_3: "Eating disorder")
  		result = clinician.all_specialties
  		expect(result).to eq("Psychopathology, OCD, Eating disorder" )
  	end
  end
end
