class User < ApplicationRecord
    has_many :user_answers
    has_many :answer_options, through: :user_answers

    def self.get_all_students
        User.all.select{|user| !user.teacher}
    end

    
    def all_answered_options
        self.user_answers.map{ |answer| answer.answer_option}
    end

    def all_correct_answers
        self.all_answered_options.select{|answer| answer.correct}
    end



    def all_answered_questions
        self.all_answered_options.map{ |answer| answer.question }
    end

    def all_answered_questions_per_category(category)
        self.all_answered_questions.select{|question| question.category === category}
    end

    def get_available_category_questions(category)
        Question.all_questions_in_category(category) - self.all_answered_questions_per_category(category)
    end

    def total_pass_rate
        if self.all_correct_answers.count == 0
        return 0
        else
        return (self.all_correct_answers.count.to_f / self.all_answered_options.count.to_f * 100).round
        end
    end


    def self.get_all_students_progress
        students_info = []
        User.get_all_students.each do |student|
            student_info = {}
            student_info["name"] = student.user_name
            student_info["pass_rate"] = student.total_pass_rate
            answered_per_cat = {}
            Question.find_all_categories.each do |category|
                key_name = "category #{category}"
                answered_per_cat[key_name] = student.all_answered_questions_per_category(category).count
            end
            student_info["answered_questions"] = answered_per_cat
            students_info << student_info
        end
        students_info
    end



end



