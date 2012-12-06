class User < ActiveRecord::Base
  attr_accessible :username, :password, :user_type
  has_many :surveys, :dependent => :destroy
	has_many :assignments
	has_many :assigned_surveys, :through => :assignments, :source => :survey
	has_many :histories
	has_many :completed_surveys, :through => :histories, :source => :survey
	def company?
		user_type == "company"
	end
	
	def agent?
		user_type == "agent"
	end

end
