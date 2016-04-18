class AddUfToCompanies < ActiveRecord::Migration
  def change
  	add_reference :companies, :uf, index: true, foreign_key: true
  end
end
