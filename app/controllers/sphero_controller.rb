class SpheroController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def info
    render json: {
      version: get_client.version,
      bluetooth: get_client.bluetooth_info,
      auto_reconnect: get_client.auto_reconnect,
      power: get_client.power_state
    }
  end

  def action
    get_client.send params[:perform], *params[:with]
    get_client.keep_going 2

    head :ok
  end

  private

  def get_client
    @client ||= Sphero.new "/dev/tty.Sphero-OBP-AMP-SPP"
  end
end
