class UsersController < ApplicationController
  def fetch_runs
    user = User.find(params[:user_id])
    render json: user.runs, only: [:id, :length, :duration, :completed]
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = JWT.encode({ user_id: user.id }, "secret")
      render json: { user: { id: user.id, email: user.email, name: user.name }, jwt: token }
    else
      render json: { error: "failed to create user" }
    end
  end

  def search
    user = User.find(params[:user_id])
    users = user.search_for_friends(params[:search_term])
    render json: users
  end

  def show_all
    user = User.find(params[:user_id])
    users = user.search_for_friends("")
    render json: users, only: [:id, :name, :email]
  end

  def request_friend
    request_sender = User.find(params[:request_sender_id])
    request_receiver = User.find(params[:request_receiver_id])
    request_sender.request_receivers << request_receiver

    render json: request_receiver, only: [:id, :name, :email]
  end

  def fetch_request_senders
    user = User.find(params[:user_id])
    pending_requests = user.request_senders - user.friends
    render json: pending_requests, only: [:id, :name, :email]
  end

  def fetch_request_receivers
    user = User.find(params[:user_id])
    pending_requests = user.request_receivers - user.friends
    render json: pending_requests, only: [:id, :name, :email]
  end

  def fetch_friends
    user = User.find(params[:user_id])
    render json: user.friends, only: [:id, :name, :email]
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
