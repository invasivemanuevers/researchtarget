class ContentController < ApplicationController
	
	def index
		@user = current_user
		@completed_surveys = @user.completed_surveys
		if (@user)
			if @user.company? 
				@assignees = User.where(:user_type => "agent")
				@surveys = @user.surveys
			else
				@surveys = @user.assigned_surveys
			end
	  end
	  
	end
	
	def assign
		@user_id = params[:user_id]
		@survey_id = params[:survey_id].first
		if (not @user_id.empty?) && (not @survey_id.empty?)
			assignee = User.where(:id => @user_id).first
			survey = Survey.where(:id => @survey_id).first
			if survey.assignees.include? assignee
				redirect_to content_path, :notice => "Already assigned"
			else 
				survey.assignees << assignee
				redirect_to content_path, :notice => "Assignment saved"
			end
		end
	end

	def test
    	@survey = Survey.find(params[:id])
    	@answer = Answer.new
  	end



	def evaluate
		@survey = Survey.find(params[:id])
		@result = 0
		total = 0
		for question in @survey.questions
			total += question.answers.length
		end

		for question in @survey.questions
			for answer in question.answers
				@user_choice = params[('check'+question.id.to_s+answer.id.to_s).to_sym]
				@correct_choice = answer.is_corect
				

				if (@user_choice.nil? && @correct_choice == false) ||
					 (@user_choice.to_i > 0 && @correct_choice == true)
					@result += 1
				end
			end
		end
		history = History.new
		history.score = @result
		history.save
		@survey.histories << history
		current_user.histories << history
		
		current_user.assigned_surveys.delete(@survey)
		

  end
end
