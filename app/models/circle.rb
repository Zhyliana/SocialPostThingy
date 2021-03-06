# == Schema Information
#
# Table name: circles
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Circle < ActiveRecord::Base
  validates :user_id, :name, presence: true
  
  belongs_to :user 
  has_many :circle_memberships
  has_many :friends, through: :circle_memberships, source: :friend
end
