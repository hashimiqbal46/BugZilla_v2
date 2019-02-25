class ProjectPolicy < ApplicationPolicy

	def create?
		#puts "---i am in create--" * 123
		user.user_type == "manager"
	end

	def edit?
		user.user_type == "manager"
	end
	
	def destroy?
		user.user_type == "manager"
	end 

	def show?
		true
	end
end