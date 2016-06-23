class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string :title
    	t.string :body
    	t.date :create_date
      t.timestamps null: false
    end
  end
end
