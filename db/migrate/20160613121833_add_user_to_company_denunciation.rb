class AddUserToCompanyDenunciation < ActiveRecord::Migration
  def change
    add_reference :company_denunciations, :user, index: true, foreign_key: true
  end
end
