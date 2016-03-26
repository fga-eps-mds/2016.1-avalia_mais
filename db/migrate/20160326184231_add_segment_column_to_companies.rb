class AddSegmentColumnToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :segment, :string
  end
end
