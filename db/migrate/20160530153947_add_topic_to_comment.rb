class AddTopicToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :topic, index: true, foreign_key: true
  end
end
