class SurveyHistory < ActiveRecord::Base
  attr_accessible :completed_by, :score, :user_id
end
