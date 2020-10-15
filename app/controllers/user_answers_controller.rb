class UserAnswersController < ApplicationController
    require 'flash'

    def new
        questions = current_user.get_available_category_questions(current_user.active_category)
        if questions.empty?
            flash[:notice] = "No Question Available, Please Contact Your Teacher"
            redirect_to user_path(current_user)
        else
        @question = questions[0]
        @answers = @question.answer_options
        @user_anwser = UserAnswer.new
        end
    end

    def create
       UserAnswer.create(answer_option_id: params[:answer_option_id], user_id: params[:user_id])
       redirect_to new_user_answers_path
    end
    
    private
    
    def user_answer_params
        params.require(:user_answer).permit(:answer_option_id, :user_id)
          end
end
