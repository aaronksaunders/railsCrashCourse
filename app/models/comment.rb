class Comment < ActiveRecord::Base
  validates :author, :body, :email, :presence => true
  validates_format_of :email, :with => /@/
  belongs_to :post
end
