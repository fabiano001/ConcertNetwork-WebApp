class User < ActiveRecord::Base
	has_secure_password

	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		unless self.role
			self.role = :user
		end
	end
end
