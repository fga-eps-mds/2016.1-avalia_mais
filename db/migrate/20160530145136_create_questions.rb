class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :options_quantity_chosen 
      t.integer :company_id

      t.timestamps
    end
  end	
end
