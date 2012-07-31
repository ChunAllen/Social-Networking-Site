class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :gender, :occupation, :city, :birthdate, :state, :country,:bio, :status, :photo_file_name, :photo_content_type, :photo_file_size,:photo_updated_at, :photo
  # attr_accessible :title, :body
	has_attached_file :photo,
# :styles => { :medium => "100x100>"}
  :default_url => '/images/Screen Shot 2012-07-19 at 2.31.38 PM.png'

  has_many :friends
  has_many :post
	
end  

