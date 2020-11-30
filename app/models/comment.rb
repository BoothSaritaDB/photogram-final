# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  photo_id   :integer
#
class Comment < ApplicationRecord

  belongs_to(:author, { :required => false, :class_name => "User", :foreign_key => "author_id", :counter_cache => true })
  belongs_to(:photo, { :required => false, :class_name => "Photo", :foreign_key => "photo_id", :counter_cache => true })

  validates(:body, { :presence => true })
  
end
