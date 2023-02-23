class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :not_valid

  before_action :check_user

  
  private
  
  def not_found(err)
    render json: { error: "#{err.model} not found"}, status: :not_found
  end
  
  def not_valid(err)
    render json: { errors: err.record.errors.full_messages}, status: :unprocessable_entity
  end
  
  def check_user
    render json: { errors: "User not authorized" }, status: 402 unless current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

end