class UserInformationsController < ApplicationController
    
    def show
        @user_information = UserInformation.find(params[:id])
        authorize @user_information
    end

    def edit

    end

    def update
      @user_information = UserInformation.find(params[:id])
      @user_information.update(user_information_params)
      redirect_to new_user_session_path
      authorize @user_information
    end

    private

    def user_information_params
     params.require(:user_information).permit(:first_name, :last_name, :bio, :github_url)
    end
end
