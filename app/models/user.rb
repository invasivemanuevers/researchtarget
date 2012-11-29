class User < ActiveRecord::Base
  attr_accessible :username, :password, :user_type
  has_many :surveys, :dependent => :destroy
	has_many :survey_assignments, foreign_key: 'assigned_to', class_name: 'SurveyAssignments'
	has_many :assigned_surveys, through: :survey_assignments, class_name: 'Survey'


	def company?
		user_type == "company"
	end
	
	def agent?
		user_type == "agent"
	end

end
