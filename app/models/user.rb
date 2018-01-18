class User < ActiveRecord::Base
  has_secure_password

  before_save { self.email = email.downcase }
  validates_presence_of :firstname
  validates_presence_of :surname
  validates :email, presence: true,
    format: { with: /\A[a-zA-Z0-9._%'+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+\z/ },
    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }

  belongs_to :user_group
end
