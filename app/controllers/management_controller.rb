class ManagementController < ApplicationController

	def list_attaches
		@attaches = Attach.all
	end

end