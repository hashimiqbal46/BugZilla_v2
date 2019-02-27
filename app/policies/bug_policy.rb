class BugPolicy < ApplicationPolicy
	

	def edit?
		false
	end

	def create?
		user.user_type == "qa"
	end

	def show?
		true
	end

	def assign_user?
		user.user_type == "developer"
	end

	def bug_resolve?
		user.user_type == "developer"
	end

end 