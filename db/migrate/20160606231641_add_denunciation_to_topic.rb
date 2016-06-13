class AddDenunciationToTopic < ActiveRecord::Migration
  def change
  	add_reference :topics, :denunciation, index: true, foreign_key: true
  	add_reference :comments, :denunciation, index: true, foreign_key: true
  end
end
