class CreateCompanyDenunciations < ActiveRecord::Migration
  def change
    create_table :company_denunciations do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
