class UsersController < ApplicationController
    before_action :authorize_user, only: [:show, :teacher_portal, :update_category]
    before_action :teacher_profile?, only: [:teacher_portal, :update_category]

          def show
            @user = User.find(params[:id])
          end
          
          def teacher_portal
            @students = User.get_all_students_progress
          end

          def update_category
            User.all.update_all(active_category: params["user"]["active_category"])
            flash[:notice] = "Question category #{params["user"]["active_category"]} now live"
            redirect_to teacher_portal_path
          end
  
          private
  
          def user_params
            params.require(:user).permit(:user_name)
          end
  
          def teacher_profile?
            unless current_user.teacher
              flash[:notice] = "Unauthorized Account"
              redirect_to user_path(current_user.id)
            end
          end
  
  end
  