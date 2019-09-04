class User < ApplicationRecord
  has_secure_password
  has_many :runs

  has_many :sent_requests, foreign_key: :request_sender_id, class_name: "Request"
  has_many :request_receivers, through: :sent_requests

  has_many :received_requests, foreign_key: :request_receiver_id, class_name: "Request"
  has_many :request_senders, through: :received_requests

  def self.search_users(id, search_string)
    User.all.select do |user|
      user.id != id.to_i && user.name.downcase.start_with?(search_string.downcase)
    end
  end

  def friends
    completed_sent_requests = sent_requests.select do |request|
      request.completed
    end

    completed_received_requests = received_requests.select do |request|
      request.completed
    end

    friends = completed_sent_requests.map(&:request_receiver) + completed_received_requests.map(&:request_sender)

    friends
  end
end
