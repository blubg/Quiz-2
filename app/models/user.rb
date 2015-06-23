class User < ActiveRecord::Base

 has_many :ideas
 has_many :comments

 has_many :memberships, dependent: :destroy


end
