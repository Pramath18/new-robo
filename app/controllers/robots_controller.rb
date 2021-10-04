class RobotsController < ApplicationController
  def orders
    input = params[:commands]
    result = Robot.execute(input)
    render json: { location: result }, status: :ok
  end
end
