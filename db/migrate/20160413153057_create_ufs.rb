class CreateUfs < ActiveRecord::Migration
  def change
    create_table :ufs do |t|
      t.string :name 

      t.timestamps null: false
    end
  end
end
