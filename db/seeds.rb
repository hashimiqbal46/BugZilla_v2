# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


	User.create(email: "hashim.iqbal@devsinc.com", password: "hashimiqbal", user_type: "developer", name: "Hashim Iqbal")
	User.create(email: "hashimrajput13@devsinc.com", password: "hashimiqbal", user_type: "manager", name: "Hashim")


	Project.create(title: "first Project", content: "This is my first Project")

	Project.first.bugs.create(title: "Feature Bug",bug_type: "Bug",status: "new",user_id: 1)
