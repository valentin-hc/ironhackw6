module ApplicationHelper
	def flash_message
		if flash["notice"].present?
			content_tag :p do 
				flash["notice"]
			end
		elsif flash["errors"].present?
			content_tag :ul do
				flash["errors"].map do |error_message|
					concat(content_tag(:li, error_message))
				end
			end
		end
	end


	def display_current_user
		links = [(link_to "Login", new_user_session_path), (link_to "Register", new_user_registration_path)]
		if current_user.present?
			content_tag :p do
				"Logged in as : #{current_user.email}" 
			end
		else
			content_tag :p do 
				links.map do |link|
					concat(content_tag(:li, link))
				end
			end
		end
	end
	def display_logout
		if current_user.present?
			button_to "Logout", destroy_user_session_path, :method => :delete
		end
	end

end
