class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :request_sender_id
      t.integer :request_receiver_id
    end
  end
end
