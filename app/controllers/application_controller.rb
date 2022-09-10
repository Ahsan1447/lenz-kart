class ApplicationController < ActionController::API

  def send_error(message)
    render json: {
      error: true,
      success: false,
      message: message
    }
  end

  def success_success(message)
    render json: {
      error: false,
      success: true,
      message: message
    }
  end
end
