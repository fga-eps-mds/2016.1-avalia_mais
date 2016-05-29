module UsersHelper
    # formatting date: day/month/year - 9:55PM
	def post_date(date)
    	date.strftime("%d/%m/%Y ")
  	end

  	def user_admin?
  		@user = current_user
		@user.admin == true
	end
end
