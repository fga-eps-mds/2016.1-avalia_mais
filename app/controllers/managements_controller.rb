class ManagementsController < ApplicationController

	def list_attaches
		if current_user.admin == true
			@attaches = Attach.all.order(:cnpj)			
		else
			redirect_to home_path
		end
	end

end