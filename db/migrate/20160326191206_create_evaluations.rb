class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :response_time
      t.integer :grade
      t.string :resolved	

      t.timestamps null: false
    end
  end
end
