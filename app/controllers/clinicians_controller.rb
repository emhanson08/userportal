class CliniciansController < ApplicationController

	def index
		@clinicians = Clinician.all
	end

	def show
		@clinician = Clinician.find_by_id(params[:id])
		render_not_found if @clinician.blank? 
	end

	private

	def clinician_params
		params.require(:clinician).permit(:id, :first_name, :last_name, :clinic, :target_patients_per_day, :days_working, :speciality_1, :speciality_2, :speciality_3)
	end

	def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize}", status: status
  end

end
