class CreateDenunciation < ActiveRecord::Migration
  def change
    create_table :denunciations do |t|
    end
    add_reference :denunciations, :user, index: true, foreign_key: true
    add_reference :denunciations, :topic, index: true, foreign_key: true
    add_reference :denunciations, :comment, index: true, foreign_key: true
  end
end
