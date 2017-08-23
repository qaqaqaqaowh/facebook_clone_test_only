class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :status
	validate :empty
	validate :liked

	def empty
		if user_id == nil
			errors.add(:user_id, "can't be blank")
		end
		if status_id == nil
			errors.add(:status_id, "can't be blank")
		end
	end

	def liked
		errors.add(:like,"Liked") if Like.find_by(user_id: user_id, status_id: status_id)
	end
end
