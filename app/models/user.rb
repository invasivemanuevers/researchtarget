class User < ActiveRecord::Base
  attr_accessible :username, :password, :user_type
  has_many :surveys, :dependent => :destroy
end
