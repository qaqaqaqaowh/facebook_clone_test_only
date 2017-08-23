class Status < ActiveRecord::Base
	belongs_to :user
	has_many :likes, dependent: :destroy
	validate :title_length
	validate :content_length
	default_scope { order('created_at DESC') }

	def title_length
		if self.title == nil
			errors.add(:title, "can't be blank")
		elsif self.title.scan(/[A-z]/).length < 8
			errors.add(:title, "title is too short")
		end
	end

	def content_length
		if self.content == nil
			errors.add(:content, "can't be blank")
		elsif
		 	self.content.scan(/[A-z]/).length < 10
			errors.add(:content, "content is too short")
		end
	end
end
