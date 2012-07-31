class Comment < ActiveRecord::Base
  attr_accessible :post_id, :user_id, :message
end
