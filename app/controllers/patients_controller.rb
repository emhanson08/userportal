class PatientsController < ApplicationController
	def index
		@patients = Patient.all
	end

	def search
		if params[:search]
			@patients = Patient.search(params[:search])
		else
			@patients = Patient.all.order("last_name").paginate(page: params[:page], per_page: 10)
		end
	end

	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.create(patient_params)

		if @patient.valid?
			redirect_to patient_path(@patient)
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def show
		@patient = Patient.find_by_id(params[:id])
		render_not_found if @patient.blank?
	end

	def edit
		@patient = Patient.find_by_id(params[:id])
		return render_not_found if @patient.blank?
	end

	def update
		@patient = Patient.find_by_id(params[:id])
		return render_not_found if @patient.blank?
		@patient.update_attributes(patient_params)
		redirect_to patient_path(@patient) if @patient.valid?
	end

	private

	def patient_params
		params.require(:patient).permit(:id, :first_name, :last_name, :address, :email, :referral_channel, :diagnosis, :primary_clinician)
	end

	def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize} :(", status: status
	end
end
