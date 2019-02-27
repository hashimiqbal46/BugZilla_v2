class Bug < ApplicationRecord

	belongs_to :user
	belongs_to :project
	mount_uploader :image, ImageUploader

	validates :bug_type,:title, presence: true 
end
