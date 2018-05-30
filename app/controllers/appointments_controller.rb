class AppointmentsController < ApplicationController
	def show
		@appointment = Appointment.find_by_id(params[:id])
		render_not_found if @appointment.blank?
	end

	private

	def appointment_params
		params.require(:appointment).permit(:patient_id, :clinician_id, :date_scheduled, :date_of_service, :canceled, :no_show, :clinic)
	end

	def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize} :(", status: status
  end
end
