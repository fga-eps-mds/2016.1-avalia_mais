class AddCompanyToAttaches < ActiveRecord::Migration
  def change
    add_reference :attaches, :company, index: true, foreign_key: true
  end
end
