class AddAttributesToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :address, :text
    add_column :companies, :telephone, :string
    add_column :companies, :email, :string
    add_column :companies, :authenticated, :bool
    add_column :companies, :description, :text
  end
end
