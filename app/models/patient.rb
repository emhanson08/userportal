class Patient < ApplicationRecord
	has_and_belongs_to_many :clinicians
	has_many :appointments

	def self.search(search)
		if search
			where('first_name LIKE ? OR last_name LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
		else
			all
		end
	end

end
