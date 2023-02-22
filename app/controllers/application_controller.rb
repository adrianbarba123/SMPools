class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :not_valid

  private

  def not_found(err)
    render json: { error: "#{err.model} not found"}, status: :not_found
  end

  def not_valid(err)
    render json: { errors: err.record.errors.full_messages}, status: :unprocessable_entity
  end

end