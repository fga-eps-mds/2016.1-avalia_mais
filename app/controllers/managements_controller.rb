class ManagementsController < ApplicationController

	def list_attaches
		@attaches = Attach.all.order(:cnpj)
	end

end