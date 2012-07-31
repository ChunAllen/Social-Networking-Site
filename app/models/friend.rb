class Friend < ActiveRecord::Base
  attr_accessible :friend_id, :user_id, :id, :status
  has_many :users
  has_many :posts
 
end
