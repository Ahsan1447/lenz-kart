class Admin::LensesController < ApplicationController
  before_action :find_lens, except: %i[index create]

  def index
    render json: Lens.all #better to use serializers
  end

  def show
    render json: @lens
  end

  def create
    lens = Lens.create!(create_params)
    render json: lens
  rescue => e
    send_error(e.message) and return
  end

  def update
    @lens.update!(update_params)
    render json: @lens.reload
  rescue => e
    send_error(e.message) and return
  end

  def destroy
    begin
      @lens.destroy!
      send_success('Successfully deleted') and return
    rescue => e
      send_error(e.message) and return
    end
  end

  private

  def create_params
    params.require(:lens)
          .permit(lens_params)
  end

  def update_params
    params.require(:lens)
          .permit(lens_params.push(:id))
  end

  def lens_params
    %i[colour description prescription_type lens_type stock price]
  end

  def find_lens
    @lens = Lens.find_by_id(params[:id])

    if @lens.blank?
      send_error('Lens does not exists') and return
    end
  end
end
