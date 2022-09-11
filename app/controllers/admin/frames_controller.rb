class Admin::FramesController < ApplicationController
  before_action :authorize_admin! #better to use pundit gem and create policy class
  before_action :find_frame, except: %i[index create]

  def index
    render json: Frame.all #better to use serializers
  end

  def show
    render json: @frame
  end

  def create
    frame = Frame.create!(create_params)
    render json: frame
  rescue => e
    send_error(e.message) and return
  end

  def update
    @frame.update!(update_params)
    render json: @frame.reload
  rescue => e
    send_error(e.message) and return
  end

  def destroy
    begin
      @frame.destroy!
      send_success('Successfully deleted') and return
    rescue => e
      send_error(e.message) and return
    end
  end

  private

  def create_params
    params.require(:lens)
          .permit(frame_params)
  end

  def update_params
    params.require(:lens)
          .permit(lens_params.push(:id))
  end

  def frame_params
    %i[name description status stock price]
  end

  def find_frame
    @frame = Frame.find_by_id(params[:id])

    if @frame.blank?
      send_error('Frame does not exists') and return
    end
  end
end
