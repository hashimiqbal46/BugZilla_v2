class Project < ApplicationRecord
	has_and_belongs_to_many :users	
	has_many :bugs


	accepts_nested_attributes_for :bugs
end
