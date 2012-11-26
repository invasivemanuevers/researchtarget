class User < ActiveRecord::Base
  attr_accessible :username, :password, :user_type
end
