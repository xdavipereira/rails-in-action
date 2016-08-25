class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	def archive
		self.update(archived_at: Time.now)
	end

	scope :excluding_archived, lambda { where(archived_at: nil)}

	def to_s
		"#{email} (#{admin? ? "Admin" : "User"})"
	end
end
