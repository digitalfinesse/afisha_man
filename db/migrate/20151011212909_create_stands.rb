class CreateStands < ActiveRecord::Migration
  def change
    create_table :stands do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.text :description
      t.text :title

      t.timestamps null: false
    end
  end
end
