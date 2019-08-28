class UsersController < ApplicationController
  def fetch_runs
    user = User.find(params[:user_id])
    render json: user.runs, only: [:id, :length, :duration, :completed]
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = JWT.encode({ user_id: user.id }, "secret")
      render json: { user: user, jwt: token }
    else
      render json: { error: "failed to create user" }
    end
  end
end
