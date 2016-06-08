class CreateFaqAnswers < ActiveRecord::Migration
  def change
    create_table :faq_answers do |t|
    	t.string :title
    	t.integer :faq_question_id
      t.timestamps null: false
    end
  end
end
