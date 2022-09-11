class GlassesController < ApplicationController
  def add_to_cart
    validate_resources! #better to create dry validation's contract

    ActiveRecord::Base.transaction do
      glasses = Glasses.create!(user: user, lens: lens, frame: frame)
      frame.decrement!(:stock)
      lens.decrement!(:stock)
      store_in_cart(glasses)
    end

    send_success("Added to cart successfully!")
  rescue => e
    send_error(e.message) and return
  end

  private

  def store_in_cart(glasses)
    cart.items.create(glasses: glasses)
  end

  def frame
    @frame ||= Frame.find_by_id(glasses_params[:frame_id])
  end

  def lens
    @lens ||= Lens.find_by_id(glasses_params[:lens_id])
  end

  def cart
    @cart ||= user.cart || Cart.create(user: user)
  end

  def validate_resources!
    fail "Could not find frame" if frame.nil?
    fail "Could not find lense" if lens.nil?

    validate_stock!
  end

  def validate_stock!
    @error_message = "Frame is out of stock." if frame.stock.zero?
    @error_message += "Lens is out of stock" if lens.stock.zero?

    fail @error_message if @error_message
  end

  def glasses_params
    params.require(:glasses)
          .permit(%i[lens_id, frame_id])
  end

  def user
    @user ||= User.find(params[:id]) #ideally devise gem should be used so that we can access current_user
  end
end
