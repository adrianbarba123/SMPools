class UsersController < ApplicationController
    def index
        render json: User.all, status: :ok
    end

    def show
        render json: {user: @current_user}, status: :ok
    end

    def destroy
        User.find(params[:id]).destroy
        head :no_content
    end

    def create
        User.create!(user_params)
        render json: user, status: :created
    end

    private

    def user_params
        params.permit(:name, :email, :password)
    end
end