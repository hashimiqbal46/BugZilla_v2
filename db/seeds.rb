# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


	User.create(email: "developer@devsinc.com", password: "Punjab@123", user_type: "developer", name: "Developer")
	User.create(email: "manager@devsinc.com", password: "Punjab@123", user_type: "manager", name: "Manager")
	User.create(email: "qa@devsinc.com", password: "Punjab@123", user_type: "qa", name: "Quality")
	User.create(email: "developer1@devsinc.com", password: "Punjab@123", user_type: "developer", name: "Developer 1")
	User.create(email: "developer2@devsinc.com", password: "Punjab@123", user_type: "developer", name: "Developer 2")
	User.create(email: "developer3@devsinc.com", password: "Punjab@123", user_type: "developer", name: "Developer 3")
	User.create(email: "developer4@devsinc.com", password: "Punjab@123", user_type: "developer", name: "Developer 4")