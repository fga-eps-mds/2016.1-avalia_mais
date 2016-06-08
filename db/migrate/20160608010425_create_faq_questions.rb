class CreateFaqQuestions < ActiveRecord::Migration
  def change
    create_table :faq_questions do |t|
    	t.string :title
    	t.integer :faq_id
      t.timestamps null: false
    end
  end
end
