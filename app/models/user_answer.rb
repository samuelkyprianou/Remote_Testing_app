class UserAnswer < ApplicationRecord
    belongs_to :user
    belongs_to :answer_option
end
