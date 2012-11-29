module UsersHelper
class Manager
	def retrieve_surveys (user_id)
		return Survey.where(:owner_id => user_id);
	end
end

end
