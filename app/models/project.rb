class Project < ApplicationRecord
	has_and_belongs_to_many :users	
	has_many :bugs

	# has_many :users, through: :projects_user

	accepts_nested_attributes_for :bugs
	# before_create :authorize

	# def authorize 
	# 	authorize projects_user
	# end
end
