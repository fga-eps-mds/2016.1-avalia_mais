class AddUserToAttaches < ActiveRecord::Migration
  def change
    add_reference :attaches, :user, index: true, foreign_key: true
  end
end
