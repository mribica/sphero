class SpheroController < ApplicationController
  skip_before_action :verify_authenticity_token

  ALLOWED = ["rgb", "roll"]

  def index
  end

  def action
    unless ALLOWED.include?(params[:perform])
      head :unprocessable_entity
    else
      sphero.send params[:perform], *params[:with]
      sphero.keep_going 1
      head :ok
    end
  end

  def rainbow
    colors = [127, 0, 255]

    13.times do
      sphero.rgb colors.sample, colors.sample, colors.sample
      sphero.keep_going 0.2
    end

    head :ok
  end

  def crazy
    10.times do
      sphero.roll 1000, rand(360)
      sphero.keep_going 0.1
    end

    head :ok
  end

  private

  def sphero
    @sphero ||= Sphero.new "/dev/tty.Sphero-OBP-AMP-SPP"
  end
end
