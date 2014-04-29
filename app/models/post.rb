# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :body, :author_id, presence: true

  belongs_to :author, class_name: "User", foreign_key: :author_id,
  inverse_of: :posts

  has_many :post_shares
  has_many :shared_circles, through: :post_shares, source: :circle

  has_many :links, inverse_of: :post


end
