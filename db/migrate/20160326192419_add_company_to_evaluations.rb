class AddCompanyToEvaluations < ActiveRecord::Migration
  def change
    add_reference :evaluations, :company, index: true, foreign_key: true
    
  end
end
