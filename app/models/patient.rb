class Patient < ApplicationRecord
	has_and_belongs_to_many :clinicians
	has_many :appointments

	def self.search(search)
		if search
			where('first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
		else
			all
		end
	end

end
