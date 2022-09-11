class ApplicationController < ActionController::API

  def send_error(message)
    render json: {
      error: true,
      success: false,
      message: message
    }
  end

  def send_success(message)
    render json: {
      error: false,
      success: true,
      message: message
    }
  end

  protected

  def formatted_price(user)
    { price: CurrencyConverter.new(user.price).send("to_#{user.currency}".to_sym) }
  end

  def authorize_admin!
    fail "Your are not authorized"  unless user.admin?
  end

  def user
    User.find(params[:user_id])
  end
end
