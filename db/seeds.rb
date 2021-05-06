# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([{ title: 'Front-end' }, { title: 'Back-end' }, { title: 'Fullstack' }])
categories_ids = categories.pluck(:id)
tests = Test.create([{ title: 'HTML', level: 1, category_id: categories_ids[0] },
                     { title: 'Go', level: 2, category_id: categories_ids[1] }, { title: 'Ruby', level: 2, category_id: categories_ids[1] }, { title: 'JavaScript', level: 3, category_id: categories_ids[2] }])

tests_ids = tests.pluck(:id)
questions = Question.create([{ body: 'what is HTML', test_id: tests_ids[0] },
                             { body: 'what is Go', test_id: tests_ids[1] }, { body: 'what is Ruby', test_id: tests_ids[1] }, { body: 'what is JavaScript', test_id: tests_ids[3] }])
