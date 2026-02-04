class User < ApplicationRecord
  # Include default devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :dynamic_templates, dependent: :destroy
  has_many :subscribers
  has_one :profile
  
  # Pro users get enhanced template capabilities
  def pro_user?
    subscription_level == 'pro'
  end
  
  # For managing auth tokens
  has_secure_token :auth_token
end
