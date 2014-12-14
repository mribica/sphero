class SpheroController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def action
    puts get_client.response_queue.to_yaml
    get_client.send params[:perform], *params[:with]
    render json: {}, location: "/"  
  end

  def get_client
    @client ||= Sphero.new "/dev/tty.Sphero-OBP-AMP-SPP"
  end
end
