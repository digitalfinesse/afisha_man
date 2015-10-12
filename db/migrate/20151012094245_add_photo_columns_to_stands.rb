class AddPhotoColumnsToStands < ActiveRecord::Migration
  def change
  	add_attachment :stands, :photo
  end
end
