class Message < ApplicationRecord
    validates :body, presence: true, length: { minimum: 2, maximum: 255 }
    validates :user_id, presence: true

    #This code sets the message to be displayed in the chatbox to be the last 20messages
    # "custom_order" was used in the chatroom_controller index to get a custom range of messages
    
    scope :custom_order, -> { order(:created_at).last(20) }
    belongs_to :user
end
