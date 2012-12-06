module ContentHelper
	def retrieve_score (user_id,survey_id)
		h = History.where(:user_id => user_id, :survey_id => survey_id).first 
		return h.score
	end
end
