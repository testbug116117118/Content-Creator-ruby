class DynamicTemplate < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :template_code, presence: true
  
  # Ensures each user has unique template names
  validates :name, uniqueness: { scope: :user_id }
  
  # Used for analytics
  has_many :template_views
  
  def view_count
    template_views.count
  end
end
