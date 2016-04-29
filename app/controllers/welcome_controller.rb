class WelcomeController < ApplicationController
  def index
  end
 	def search
  		company = Company.find_by(name: params[:company][:name])
  		if company
  			redirect_to company
  		else
  			render :index
  		end
	end
end
