require 'rails_helper'

RSpec.describe CliniciansController, type: :controller do
	describe 'clinicians#index' do
		it 'should successfully render the index page' do
			get :index
			expect(response).to have_http_status(:success)
		end
	end

	describe 'clinicians#show' do
		it 'should successfully show the clinician page' do
			clinician = FactoryBot.create(:clinician)
			get :show, params: { id: clinician.id }
			expect(response).to have_http_status(:success)
		end

		it 'should render not found if the clinician does not exist' do
			clinician = FactoryBot.create(:clinician)
			get :show, params: { id: 'PUPPERS' }
			expect(response).to have_http_status(:not_found)
		end
	end

end
