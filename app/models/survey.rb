class Survey < ActiveRecord::Base
  attr_protected :user_id
  belongs_to :user
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda {|a| a[:content].blank?}, :allow_destroy => true

	has_many :survey_assignments, class_name: 'SurveyAssignments'
	has_many :assignees, through: :survey_assignments, class_name: 'User'
end
