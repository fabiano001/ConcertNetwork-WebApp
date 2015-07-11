module ApplicationHelper
	
	def flash_message
		if(flash[:alert].present?)
			content_tag(:div, :class => "alert") do
				flash[:alert]
			end
		elsif(flash[:notice].present?)
			content_tag(:div, :class => "notice") do
				flash[:notice]
			end
		end
	end

end
