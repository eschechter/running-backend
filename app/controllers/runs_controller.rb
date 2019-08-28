class RunsController < ApplicationController
  def create
    Run.create!(run_params)
  end

  def show
    run = Run.find(params[:id])
    render json: run
  end

  private

  def run_params
    params.require(:run).permit(:user_id, :length, coordinates: [:latitude, :longitude])
  end
end
