class ManagementsController < ApplicationController

	def list_attaches
		#if user_admin?
			@attaches = Attach.all.order(:cnpj)			
		#else
		#	redirect_to home_path
		#end
	end

end