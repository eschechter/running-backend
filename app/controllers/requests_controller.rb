class RequestsController < ApplicationController
  def complete
    request = Request.find_by(request_sender_id: params[:request_sender_id],
                              request_receiver_id: params[:request_receiver_id])

    request.update(completed: true)
  end
end
