class Question < ApplicationRecord
    has_many :answer_options

    #Array of category numbers
    def self.find_all_categories
        Question.distinct.pluck(:category)
    end
    # All question from a category
    def self.all_questions_in_category(category)
        Question.where(category: category)
    end

end
