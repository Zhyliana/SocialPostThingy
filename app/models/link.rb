# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  title      :string(255)      not null
#  url        :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  validates :post, :title, :url, presence: true

  belongs_to :post, inverse_of: :links
  has_many :shared_circles, through: :post, source: :shared_circles
  has_one :author, through: :post, source: :author

end
