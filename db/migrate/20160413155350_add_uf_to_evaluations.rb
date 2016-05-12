class AddUfToEvaluations < ActiveRecord::Migration
  def change
  	add_reference :evaluations, :uf, index: true, foreign_key: true
  end
end
