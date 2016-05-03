class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :password
      t.string :login
      t.date :dateBirthday
      t.string :image
      t.boolean :active
      t.boolean :admin
      t.integer :uf_id

      t.timestamps null: false
    end
  end
end
