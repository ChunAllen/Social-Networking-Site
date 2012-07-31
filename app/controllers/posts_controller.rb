class PostsController < ApplicationController

	def new
		@post = Post.new
		@postcomment = Comment.new

		#IF CURRENT USER WAS FOLLOWED
		@myfriend = Friend.find(:all, :conditions => { :friend_id => current_user.id , :status => "1" } )
		
		#IF CURRENT USER WAS FOLLOWING SOMEONE USER
		@myfriend2 = Friend.find(:all, :conditions => { :user_id => current_user.id , :status => "1"  } )
	
		#display all post desc
		@postfriends = Post.find(:all, :order => "created_at DESC") 
		

		#display all users
		@postuser = User.all

		@count= Friend.where("user_id = ? AND status = ?",current_user.id ,"0").count(:all)
    	@count2 = Friend.where("user_id = ? AND status = ?",current_user.id ,"1").count(:all)

    	#show all users and their comments to specific post
    	@showcomment = Comment.find(:all)

    	@showuser = User.all
		
	end


	def message
		@post = Post.new
		
	end

	def create
		
		 @post = Post.new(params[:post])
		 if @post.save
		  	@postlist = Post.where("posts.user_id = ?", current_user.id ).order("created_at DESC").limit(9)
		  	redirect_to hub_path
		  else
		  	redirect_to new_post_path
		  end

		

	end

	def comment

		
		# @postcomment = Comment.new(params[:postcomment])
		# @postcomment.save
		

		

	end


	
    
 

end
