class SpheroController < ApplicationController
  skip_before_action :verify_authenticity_token

  ALLOWED = ["rgb", "roll"]

  def index
  end

  def action
    unless ALLOWED.include?(params[:perform])
      head :unprocessable_entity
    else
      get_client.send params[:perform], *params[:with]
      get_client.keep_going 1
      head :ok
    end
  end

  def rainbow
    colors = [127, 0, 255]

    13.times do
      get_client.rgb colors.sample, colors.sample, colors.sample
      get_client.keep_going 0.2
    end

    head :ok
  end

  private

  def get_client
    @client ||= Sphero.new "/dev/tty.Sphero-OBP-AMP-SPP"
  end
end
