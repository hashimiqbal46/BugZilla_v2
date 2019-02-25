class BugPolicy < ApplicationPolicy
	

	def edit?
		user.user_type == "developer"
	end

	def create?
		user.user_type == "qa"
	end

	def show?
		true
	end

	def destroy?
		false
	end

end 