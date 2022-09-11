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
end
