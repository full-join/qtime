class LinesController < ApplicationController
  # before_action: :authenticate_user!
  def create
    @place = Place.find_or_create_by(google_id: params["google_id"])
    @line = @place.lines.new(line_params)
    @line.save
    render json: @line
  end

  def line_params
    params.require(:line).permit(:user_id, :arrived_at)
  end

end
