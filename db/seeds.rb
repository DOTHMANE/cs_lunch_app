# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Department.create(name: "operations")
Department.create(name: "sales")
Department.create(name: "marketing")
Department.create(name: "risk")
Department.create(name: "management")
Department.create(name: "finance")
Department.create(name: "HR")
Department.create(name: "development")
Department.create(name: "data")
User.create(email:'test@gmail.de', password:'12345678', password_confirmation:'12345678')
