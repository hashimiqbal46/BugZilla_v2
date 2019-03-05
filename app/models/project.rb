class Project < ApplicationRecord

	has_many :projects_users,     dependent: :destroy
	has_many :users, through: :projects_users
	has_many :bugs,		dependent: :destroy

	validates :title, presence: true

	accepts_nested_attributes_for :bugs
end
