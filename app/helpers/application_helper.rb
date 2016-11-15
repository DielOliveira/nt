module ApplicationHelper

	def showDate(value,hora)

		if hora == true
			return (value.blank? ? '' : value.strftime("%d/%m/%Y - %H:%M")).html_safe
		else
			return (value.blank? ? '' : value.strftime("%d/%m/%Y")).html_safe
		end

	end

	def iconTrueOrFalse(value)

		#byebug 

		if value == true
			return "<i class='fa fa-check'></i>".html_safe
		else
			return "<i class='fa fa-close'></i>".html_safe
		end

	end
		
end
