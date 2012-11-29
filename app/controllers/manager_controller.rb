class ManagerController < ApplicationController
	def index
		@surveys = if current_user.company? 
			current_user.surveys 
		else
			current_user.assigned_surveys 
		end
	end
	
	def test
    	@survey = Survey.find(params[:id])
    	@answer = Answer.new
  	end

  	def evaluate

  	end
end
