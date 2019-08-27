class RunsController < ApplicationController
  def create
    byebug
    Run.create!(run_params)
  end

  private

  def run_params
    params.require(:run).permit(:user_id, coordinates: [:latitude, :longitude])
  end
end
