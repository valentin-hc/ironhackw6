module ApplicationHelper
	def display_user_and_logout
		if current_user.present?
			actions= ["Hello #{current_user.name} !",
					 (button_to "Logout", destroy_user_session_path, :method => :delete, :class => "btn btn-primary")]
			content_tag :div do
				actions.map do |action|
					concat(content_tag(:p, action))
				end
			end
		end
	end
end
