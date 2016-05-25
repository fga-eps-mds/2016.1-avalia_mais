class CreateAttaches < ActiveRecord::Migration
  def change
    create_table :attaches do |t|
      t.string :cnpj
      t.string :address
      t.attachment :photo

      t.timestamps null: false
    end
  end
end
