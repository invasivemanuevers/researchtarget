class Evaluation
  extend ActiveModel::Naming


  attr_accessor :survey, :user_answers

  def initialize(survey, user_answers)
    @survey = survey
    @user_answers = user_answers
  end


  def answers
    @answers ||= begin
      answers = {}
      @survey.answers.where(is_corect: true).each do |answer|
        (answers[answer.question_id]||=[]) << answer.id
      end
      answers
    end
  end

  def persisted?
    false
  end


  def normalized_answers
    @normalized_answers ||= begin
      normalized_answers = {}
      user_answers.map do |question_id, given_answers|
        normalized_answers[question_id.to_i] = given_answers.select { |id,value| ["true","1","on"].include? value.to_s }.keys.map(&:to_i)
      end
      normalized_answers
    end
  end


  def value_for(question,answer)
    (normalized_answers[question.id]||[]).include? answer.id
  end

  def validate

    valid_questions = 0
    invalid_questions = 0

    user_answers.each do |question_id, given_answers|
      valid_answers = answers[question_id.to_i]||[]
      user_answers = normalized_answers[question_id.to_i]||[]

      invalid_answers = user_answers - valid_answers
      unless invalid_answers.empty?
        valid_questions +=1
      else
        invalid_questions += 1
      end
    end
    true
  end

  def new_record?
    true
  end


  def to_key
    [nil]
  end

end
