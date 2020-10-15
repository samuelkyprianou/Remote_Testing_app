# This file shoulwa1contain all the recorwa1creation needewa1to seewa1the database with its default values.
# The data can then be loadewa1with the rails db:seewa1commanwa1(or createwa1alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lorwa1of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#---- Teacher
t = User.create(user_name:"Sam", teacher: true, active_category: 1)

#---- Students
s1 = User.create(user_name:"John", teacher: false, active_category: 1)
s2 = User.create(user_name:"Jeff", teacher: false, active_category: 1)
s3  = User.create(user_name:"Mike", teacher: false, active_category: 1)



    (1..5).each do |i| 
(1..10).each do |ii| 
q = Question.create(question: "question#{ii}", category: i)
AnswerOption.create(option:"winner", question_id: q.id, correct: true)
(1..3).each do |iii| 
    AnswerOption.create(option:"loser", question_id: q.id, correct: false)
end
end
end

