class Project < ApplicationRecord

	has_many :projects_users,     dependent: :destroy
	has_many :users, through: :projects_users
	has_many :bugs,		dependent: :destroy

	# has_many :users, through: :projects_user

	accepts_nested_attributes_for :bugs
	# before_create :authorize

	# def authorize 
	# 	authorize projects_user
	# end
end
