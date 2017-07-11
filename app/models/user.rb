class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password   # Magic Rails method that validates the password

  before_save { |user| user.email = email.downcase }

  validates  :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates  :email, presence: true, format: { with: VALID_EMAIL_REGEX } , 
                                    uniqueness: { case_sensitive: false }
  # The requirement for uniqueness is not fully secure, race conditions
  # can occur. We need to enforce
  # it in the database by adding an 'index' to the email field.
  # ALSO, we need to have the email turned to lower case before saving in the database by using the before_save callback provided by Rails.

  validates :password, presence: true, length: { minimum: 6 }


  validates :password_confirmation, presence: true

end
