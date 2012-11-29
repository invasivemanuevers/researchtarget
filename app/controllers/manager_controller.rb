class ManagerController < ApplicationController
	def index
		@user = session['user']
		if (@user.user_type == "company")
			@surveys = Survey.where(:user_id => @user.id);
		else 
			@surveys = Survey.where(:id => SurveyAssignments.select("survey_id").where(:assigned_to => session['user'].id))
		end
	end
	
	def test
    	@survey = Survey.find(params[:id])
    	@answer = Answer.new
  	end

  	def evaluate

  	end
end
