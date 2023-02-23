class SessionsController < ApplicationController

    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: {user: user}, status: 200
        else
            render json: {message: "Invalid credentials!"}, status: 400
        end
    end

    def logout
        session.delete(:user_id)
        render json: {message: "Successfully logged out!"}, status: 204
    end
end