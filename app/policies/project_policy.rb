class ProjectPolicy < ApplicationPolicy

	def create?
		user.user_type == "manager"
	end

	def edit?
		user.user_type == "manager"
	end
	
	def destroy?
		user.user_type == "manager"
	end 

	def project_add_user?
		user.user_type == "manager"
	end

	def project_remove_user?
		user.user_type == "manager"
	end

	def update?
		user.user_type == "manager"
	end

	def project_users?
		user.user_type == "manager"
	end 
end