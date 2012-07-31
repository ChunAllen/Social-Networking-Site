class FriendsController < ApplicationController
  
  def show
  end
  

  def friend
      @friends = User.where("users.id !=?", current_user.id)
  end

  def myfriends

    
     #FOLLOWING QUERIES
    @myfriend = Friend.find(:all, :conditions => { :user_id => current_user.id, :status => "1" } )
    
    @myfollowuser = User.all

    @count= Friend.where("user_id = ? AND status = ?",current_user.id ,"0").count(:all)
    @count2 = Friend.where("user_id = ? AND status = ?",current_user.id ,"1").count(:all)
  end

  def following
      #FOLLOWERS   
      @followers = User.all :joins => :friends, :conditions => { :friends => { :friend_id => current_user.id , :status => "1"} }
    
  end



  def create  	
  	 @friend = Friend.new(params[:friend])
  	 @friend.save
     redirect_to friend_friends_path
  end


 #Cancel Friend Request/Refuse Friend Request
  def destroy 
    @friendrefuse = Friend.find(params[:id])
    @friendrefuse.destroy
    redirect_to hub_path
  end

  #confirm friend request
  def update
    @friend = Friend.find(params[:id])
    @friend.update_attributes(:status => "1")
    redirect_to hub_path
  end

  


end
