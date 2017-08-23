class User < ActiveRecord::Base
	has_secure_password
	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy
	validates :password, length: {in: 6..20}
	validates :name, :password_confirmation, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

	# def empty
	# 	# errors.add(:email, "can't be blank") if email == nil
	# 	# errors.add(:name, "can't be blank") if name == nil
	# 	errors.add(:password, "not between the range") if password.length < 6 || password.length > 20
	# end
end
