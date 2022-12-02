class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method
  
  def unprocessable_entity_method e
    render json: {errors: [e.record.errors]}, status: :unprocessable_entity
  end
end
