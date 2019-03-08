class Project < ApplicationRecord

	has_many :projects_users,     dependent: :destroy
	has_many :users, through: :projects_users
	has_many :bugs,		dependent: :destroy

	validates :title, presence: true

	accepts_nested_attributes_for :bugs


	def classify_users
		accepts_users = self.users.all
    reject = User.all - accepts_users
		[accepts_users, reject]
	end
end
