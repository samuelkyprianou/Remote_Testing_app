class Question < ApplicationRecord
    has_many :answer_options

    
    def self.find_all_categories
        Question.distinct.pluck(:category)
    end

    def self.all_questions_in_category(category)
        Question.where(category: category)
    end

end
