class AddSegmentToCompanies < ActiveRecord::Migration
  def change
	add_reference :companies, :segment, index: true, foreign_key: true
  end
end
