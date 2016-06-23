class AddTopicsToCompany < ActiveRecord::Migration
  def change
    add_reference :topics, :company, index: true, foreign_key: true
  end
end
