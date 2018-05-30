require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
	describe 'appointments#show' do
		it 'should successfully show the appointment page' do
			clinician = FactoryBot.create(:clinician, id: 1)
			patient = FactoryBot.create(:patient, id: 1)
			appointment = FactoryBot.create(:appointment, clinician_id: clinician.id, patient_id: patient.id)
			get :show, params: { id: appointment.id }
			expect(response).to have_http_status(:success)
		end

		it 'should render not found if the appointment does not exist' do
			clinician = FactoryBot.create(:clinician, id: 1)
			patient = FactoryBot.create(:patient, id: 1)
			appointment = FactoryBot.create(:appointment, clinician_id: clinician.id, patient_id: patient.id)
			get :show, params: { id: 'DOGS' }
			expect(response).to have_http_status(:not_found)
		end
	end
end
