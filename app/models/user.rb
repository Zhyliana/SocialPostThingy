# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_accessor :password, :friend

  before_validation :ensure_session_token

  validates_presence_of :email, :password_digest, :session_token
  validates :email, uniqueness: true
  validates :password, length: { minimum: 2, allow_nil: true }

  has_many :circles
  has_many :circle_memberships, class_name: "CircleMembership",
      foreign_key: :user_id, primary_key: :id
  has_many :friends, through: :circles, source: :friends

  has_many :posts, class_name: "Post", foreign_key: :author_id, inverse_of: :author

  def password=(plain_text)
    self.password_digest = BCrypt::Password.create(plain_text)
    @password = plain_text
  end

  def is_password?(password)
     BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(params)
    @user = User.find_by_email(params[:email])
    @user.try(:is_password?, params[:password]) ? @user : nil
  end

  def ensure_session_token
    self.session_token = SecureRandom.hex
  end



end
