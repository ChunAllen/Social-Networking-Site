class CommentsController < ApplicationController


	def new
		@postcomment = Comment.new
	end


	def create

		@postcomment = Comment.new(params[:comment])
		@postcomment.save
		 redirect_to hub_path
	

		# @friend = Friend.new(params[:friend])
  # 	 	@friend.save
  #    	redirect_to friend_friends_path
	
	end

end
