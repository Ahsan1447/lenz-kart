class LensesController < ApplicationController
  before_action :find_user
  def index
    render json: { lenses: lenses } #serializer should be used
  end

  private

  def lenses
    Lens.all.map {_1.merge(formatted_price(user))} #ideally pagination
  end

  def user
    @user ||= User.find(params[:id]) #ideally devise gem should be used so that we can access current_user
  end
end
