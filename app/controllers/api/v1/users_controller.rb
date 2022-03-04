module Api
  module V1
    class UsersController < ApplicationController
      def login
        @user = User.find_by(email: params[:email])
        return unless sign_in(@user, password: params[:password])

        @user.api_token = Devise.friendly_token.to_s
        @user.save
        respond_to do |format|
          format.json { render json: @user.api_token.to_json, status: :ok }
        end
      end
    end
  end
end
