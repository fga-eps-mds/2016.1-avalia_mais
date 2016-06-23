class AddCompanyToCompanyDenunciation < ActiveRecord::Migration
  def change
    add_reference :company_denunciations, :company, index: true, foreign_key: true
  end
end
