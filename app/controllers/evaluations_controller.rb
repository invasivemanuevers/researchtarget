class EvaluationsController < ApplicationController


  helper_method :resource, :survey




  def update
    if resource.validate
      redirect_to user_survey_evaluation_path(resource.survey)
    else
      render :new
    end
  end

  def resource
    @resource ||= Evaluation.new(survey, resource_params)
  end


  def survey
    @survey ||= current_user.assigned_surveys.find(params[:user_survey_id])
  end


  def resource_params
    params[:evaluation]||{}
  end
  # def evaluate

    # @survey = Survey.find(params[:id])
    # @result = 0
    # total = 0
    # for question in @survey.questions
    #   total += question.answers.length
    # end

    # for question in @survey.questions
    #   for answer in question.answers
    #     @user_choice = params[('check'+question.id.to_s+answer.id.to_s).to_sym]
    #     @correct_choice = answer.is_corect


    #     if (@user_choice.nil? && @correct_choice == false) ||
    #        (@user_choice.to_i > 0 && @correct_choice == true)
    #       @result += 1
    #     end
    #   end
    # end
    # history = History.new
    # history.score = @result
    # history.save
    # @survey.histories << history
    # current_user.histories << history

    record = current_user.histories.build(score: @result, survey: @survey)
    if record.save

    end


    record = History.new(score: @result, survey: @survey, user: current_user)
    if record.save

    end

    # current_user.assigned_surveys.delete(@survey)


  # end


end
