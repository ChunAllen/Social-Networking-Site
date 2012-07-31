class Post < ActiveRecord::Base
   attr_accessible :message, :id, :user_id, :posts, :friend_id
   belongs_to :friend
   belongs_to :user
end
