class RequestsController < ApplicationController
  def complete
    puts params
    request = Request.find_by(request_sender_id: params[:request_sender_id],
                              request_receiver_id: params[:request_receiver_id])

    request.update(completed: true)

    render json: User.find(params[:request_sender_id]), only: [:id, :name, :email]
  end
end
