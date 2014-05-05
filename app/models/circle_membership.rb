# == Schema Information
#
# Table name: circle_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  circle_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class CircleMembership < ActiveRecord::Base

  belongs_to :friend, class_name: "User", foreign_key: :user_id
  belongs_to :circle
  has_one :owner, through: :circle, source: :user

end
