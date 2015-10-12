class AddcolumnToStandsCity < ActiveRecord::Migration
  def change
  	add_column :stands, :city, :string
  end
end
