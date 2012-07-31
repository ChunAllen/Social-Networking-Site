class SitesController < ApplicationController
  
  def index

    if user_signed_in?
   
      @profile = User.all
   
      
      #displaying all current user's posts
      @post = Post.new
      @postlist = Post.where("posts.user_id = ?", current_user.id ).order("created_at DESC").limit(6)
      #end

      #counting all friend requests  
      @friendsRequests = Friend.where("friend_id = ? AND status = ?",current_user.id ,"0").count(:all) 
      
      #wala
      @friendrowid = Friend.where("friend_id = ? AND status = ?", current_user.id , "0").first   
      
      #friend request
      @friendAdd = User.all :joins => :friends, :conditions => { :friends => { :friend_id => current_user.id } && { :status => "0"} }
     
      @showcomments = Comment.find(:all, :order => "created_at DESC")

      @postcomment = Comment.new

    else
        redirect_to new_user_session_path
    end
  end
  
  #Cancel Friend Request/Refuse Friend Request
  def destroy
    @friendrefuse = Friend.find(params[:id])
    @friendrefuse.destroy
    redirect_to hub_path
  end


  def logout

   redirect_to new_user_session_path

  end

  def confirm_friend
    @friend = Friend.find(params[:id])
    @friend.update_attributes(params[:status => 1])
    @friend.save
  end
  
end
