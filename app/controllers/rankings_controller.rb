class RankingsController < ApplicationController
  def grade_all
  		@companies = Company.all
  end

  def grade_category
  end
  
end