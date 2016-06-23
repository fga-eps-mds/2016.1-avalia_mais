class AddUserToTopics < ActiveRecord::Migration
  def change
    add_reference :topics, :user, index: true, foreign_key: true
  end
end
