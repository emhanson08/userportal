require 'rails_helper'

RSpec.describe PatientsController, type: :controller do

	describe 'patients#index' do
		it 'should successfully render the index page' do
			get :index
			expect(response).to have_http_status(:success)
		end
	end

	describe 'patients#new' do
		it 'should show the patient intake form' do
			patient = FactoryBot.create(:patient)
			get :new
			expect(response).to have_http_status(:success)
		end
	end

	describe 'patients#create' do
		it 'should successfully create a patient record' do
			post :create, params: { patient: { id: 7 } }
			patient = Patient.last
			expect(patient.id).to eq (7)
			expect(response).to redirect_to patient_path(patient)
		end
	end

	describe 'patients#show' do
		it 'should successfully show the patient page' do
			patient = FactoryBot.create(:patient)
			get :show, params: { id: patient.id }
			expect(response).to have_http_status(:success)
		end

		it 'should render not found if the patient does not exist' do
			patient = FactoryBot.create(:patient)
			get :show, params: { id: 'YAY' }
			expect(response).to have_http_status(:not_found)
		end
	end

	describe 'patients#edit' do
		it 'should show the patient edit page' do
			patient = FactoryBot.create(:patient)
			get :edit, params: { id: patient.id }
			expect(response).to have_http_status(:success)
		end

		it 'should render not found if the patient does not exist' do
			patient = FactoryBot.create(:patient)
			get :edit, params: { id: 'KITTY' }
			expect(response).to have_http_status(:not_found)
		end
	end

	describe 'patients#update' do
		it 'should successfully update patient records' do
			patient = FactoryBot.create(:patient)
			patient.update(first_name: 'Danielle')
			patient.save
			expect(response).to have_http_status(:success)
			expect(patient.first_name).to eq('Danielle')
		end

		it 'should render not found if the patient does not exist' do
			patient = FactoryBot.create(:patient)
			patch :update, params: { id: 'RATTIES', patient: { first_name: 'Charles' } }
			expect(response).to have_http_status(:not_found)
		end
	end

	describe 'patients#search' do
		it 'should render all matching records in the database' do
			patient = FactoryBot.create(:patient, first_name: 'Dave')
			get :search, params: { search: 'Dave' }
			expect(response).to have_http_status(:success)
		end

		it 'should render all records if there is no search term entered' do
			get :search
			expect(response).to have_http_status(:success)
		end
	end

end
