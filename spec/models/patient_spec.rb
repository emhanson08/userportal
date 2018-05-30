require 'rails_helper'

RSpec.describe Patient, type: :model do

	describe 'patient#search' do
		it 'should return an array of matching records in the database' do
			patient1 = FactoryBot.create(:patient, id: 1, first_name: 'Dave', last_name: 'Smith', email: "dave@dave.com")
			results = Patient.search("Dave")
			expect(results).to eq([patient1])
		end

		it 'should return an empty array if there are no matches' do
			results = Patient.search('Arya')
			expect(results).to eq([])
		end
	end

end
