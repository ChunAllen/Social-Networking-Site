class UsersController < ApplicationController

	def index
        @user = User.find(session[:id])

        if param_posted?(:user)
         	if @user.update_attributes(params[:user])
            flash[:notice] = "Email updated."
            redirect_to :action => "index"
    	   end
        end

     
	end

 
  def show
      @friend = Friend.new
      @user = User.find(params[:id])
      #@friend = Friend.new(params[:friend])
      @friends = Friend.where("user_id = ? AND friend_id =?",current_user.id ,@user.id).count(:all) 

      @friendspic = Friend.where("user_id = ? AND friend_id =?",current_user.id ,@user.id)

      @getallusers = User.all

      @getid = Friend.where("user_id = ? AND friend_id =?",current_user.id ,@user.id).first

      @getid2 = Friend.where("user_id = ? AND friend_id =?",@user.id ,current_user.id).first

      @unfriend = Friend.where("user_id = ? AND friend_id =? AND status=?",current_user.id ,@user.id, "1").count(:all) 

      @countunfriend = Friend.where("user_id = ? AND friend_id = ?",current_user.id, @user_id).count(:all) 

      @unfriend2= Friend.where("user_id = ? AND friend_id =? AND status=?",@user.id ,current_user.id, "1").count(:all) 


   #   @userfriendpost = Post.where("user_id = ?", @user.id).first

       @myposts = Post.where("user_id = ?", @user.id ).order("created_at DESC").limit(6)

       @showcomments = Comment.find(:all, :order => "created_at DESC")

        @postcomment = Comment.new
  end

 


  def destroy
    @friendrefuse = Friend.find(params[:id])
    @friendrefuse.destroy
    redirect_to hub_path
  end
  



	def edit
    @user = current_user
  end


  def update_password
    @user = User.find(current_user.id)
      
      if @user.update_attributes(params[:user])
          # Sign in the user by passing validation in case his password changed
          sign_in @user, :bypass => true
          redirect_to root_path
      else
          render "edit"
      end
  end


end
