class RunsController < ApplicationController
  def create
    run = Run.create!(run_params)
    render json: run
  end

  def show
    run = Run.find(params[:id])
    render json: run
  end

  def update
    run = Run.find(params[:id])
    run.update(duration: params[:duration], completed: true)
    render json: run
  end

  private

  def run_params
    params.require(:run).permit(:user_id, :length, coordinates: [:latitude, :longitude])
  end
end
