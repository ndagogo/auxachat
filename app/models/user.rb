class User < ApplicationRecord
        before_validation :strip_username_whitespace
        before_save :normalize_email, :normalize_username
        
    validates :username, presence: true, length: { minimum: 5, maximum: 25 },
               uniqueness: { case_sensitive: false } 

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    validates :email, presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: {maximum: 105},
            format: { with: VALID_EMAIL_REGEX }

    validates :phone, presence: true, length: { minimum: 11, maximum: 11 }

    private    
    def strip_username_whitespace
        self.username = username.strip.gsub(/\s+/, "") if username.present?
    end


    def normalize_email
        self.email = email.downcase
    end

    def normalize_username
        self.username = username.downcase
    end

    has_many :messages
    has_secure_password

end
