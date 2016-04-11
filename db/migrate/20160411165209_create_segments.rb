class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.text :segment

      t.timestamps null: false
    end
  end
end
