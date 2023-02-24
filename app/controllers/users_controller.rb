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

    def update
        # user = User.find(params[:id])
        if @current_user.update(user_params)
          render json: { user: @current_user }, status: :ok
        else
          render json: { message: "Failed to update user" }, status: :unprocessable_entity
        end
    end

    def pools
        @user = User.find(params[:id])
        render json: @user.pools, status: :ok
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    # def user_params
    #     params.require(:user).permit(:name, :email)
    # end
end