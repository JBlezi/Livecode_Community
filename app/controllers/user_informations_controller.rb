class UserInformationsController < ApplicationController
    
    def show
        @user_information = UserInformation.find(params[:id])
        authorize @user_information
    end

    def edit

    end

    def update

    end
end
