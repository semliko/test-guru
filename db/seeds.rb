# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{ first_name: 'Bill', last_name: 'Petrov', email: 'email_one@email.com', password: '12345678' }, { first_name: 'John', last_name: 'Fedorov', email: 'email_two@email.com', password: '12345678' }])

categories = Category.create!([{ title: 'Front-end' }, { title: 'Back-end' }, { title: 'Fullstack' }])
categories_ids = categories.pluck(:id)
tests = Test.create!([{ author_id: users.first.id, title: 'HTML', level: 1, category_id: categories_ids[0] },
                      { author_id: users.first.id, title: 'Go', level: 2, category_id: categories_ids[1] },
                      { author_id: users.first.id, title: 'Ruby', level: 2, category_id: categories_ids[1] },
                      { author_id: users.first.id, title: 'JavaScript', level: 3, category_id: categories_ids[2] }])

tests_ids = tests.pluck(:id)
questions = Question.create!([{ body: 'what is HTML?', test_id: tests_ids[0] },
                              { body: 'what is Go?', test_id: tests_ids[0] },
                              { body: 'what is Ruby?', test_id: tests_ids[0] },
                              { body: 'what is JavaScript?', test_id: tests_ids[0] },
                              { body: 'what is HTML?', test_id: tests_ids[1] },
                              { body: 'what is Go?', test_id: tests_ids[1] },
                              { body: 'what is Ruby?', test_id: tests_ids[1] },
                              { body: 'what is JavaScript?', test_id: tests_ids[1] },
                              { body: 'what is HTML?', test_id: tests_ids[2] },
                              { body: 'what is Go?', test_id: tests_ids[2] },
                              { body: 'what is Ruby?', test_id: tests_ids[2] },
                              { body: 'what is JavaScript?', test_id: tests_ids[2] }])


User.find_by(id: users.first.id).tests << tests.first(2)

a1 = Answer.new(body: 'HTML is Hyper Text Markup Language', correct: true)
a2 = Answer.new(body: 'HTML is a programming language', correct: false)
a3 = Answer.new(body: 'HTML is a movie', correct: false)
a4 = Answer.new(body: 'HTML is an animal', correct: false)

a5 = Answer.new(body: 'GO is a programming language', correct: true)
a6 = Answer.new(body: 'GO is a fruit', correct: false)
a7 = Answer.new(body: 'GO is a verb', correct: false)
a8 = Answer.new(body: 'GO is a short word', correct: false)

a9 = Answer.new(body: 'Ruby is a programming language', correct: true)
a10 = Answer.new(body: 'Ruby is a miniral', correct: false)
a11 = Answer.new(body: 'Ruby is a colour', correct: false)
a12 = Answer.new(body: 'Ruby is a name', correct: false)

a13 = Answer.new(body: 'JavaScript is a programming language', correct: true)
a14 = Answer.new(body: 'JavaScript is a Java', correct: false)
a15 = Answer.new(body: 'JavaScript is a car', correct: false)
a16 = Answer.new(body: 'JavaScript is a shape', correct: false)

Question.where(body: 'what is HTML?').first.answers << [a1, a2, a3, a4]
Question.where(body: 'what is Go?').first.answers << [a5, a6, a7, a8]
Question.where(body: 'what is Ruby?').first.answers << [a9, a10, a11, a12]

Question.where(body: 'what is JavaScript?').first.answers << [a13, a14, a15, a16]
