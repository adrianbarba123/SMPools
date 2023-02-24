class UsersController < ApplicationController
    skip_before_action :check_user, only: [:create]


    def index
        render json: User.all, status: :ok
    end

    def show
        render json: {user: @current_user}, status: :ok
    end

    def destroy
        @current_user.destroy
        head :no_content
    end

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    private

    def user_params
        params.permit(:name, :email, :password)
    end
end