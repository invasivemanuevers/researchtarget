module EvaluationsHelper

  def answer_checkbox_tag(survey,question,answer)
    options = {}
    checked = resource.value_for(question,answer)
    options[:checked] = checked if checked
    check_box_tag "evaluation[#{question.id}][#{answer.id}]", "true", checked
  end
end
