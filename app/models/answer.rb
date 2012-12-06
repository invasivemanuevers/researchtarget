class Answer < ActiveRecord::Base
	attr_protected :question_id
	belongs_to :question


end
