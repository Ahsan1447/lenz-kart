class FramesController < ApplicationController
  def index
    render json: { frames: frames } #serializer should be used
  end

  private

  def frames
    Frame.active.map {_1.merge(formatted_price(user))} #ideally pagination and serializer should be used
  end
  def user
    @user ||= User.find(params[:id]) #ideally devise gem should be used so that we can access current_user
  end
end
