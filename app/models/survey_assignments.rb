class SurveyAssignments < ActiveRecord::Base
  attr_accessible :assigned_to, :user_id

	belongs_to :survey
	belongs_to :user
	belongs_to :assignee, foreign_key: :assigned_to, class_name: 'User'
end
