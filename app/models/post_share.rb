# == Schema Information
#
# Table name: post_shares
#
#  id         :integer          not null, primary key
#  circle_id  :integer          not null
#  post_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class PostShare < ActiveRecord::Base
  validates :circle_id, :post_id, presence: true

  belongs_to :circle
  belongs_to :post

  has_one :owner, through: :post, source: :author
end
