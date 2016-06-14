class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
    	t.float :response_time
    	t.float :rate

      	t.timestamps null: false
    end
  end
end
