class Stand < ActiveRecord::Base

	geocoded_by :address
	after_validation :geocode

	has_attached_file :photo, styles: { medium: "500x400>", thumb: "250x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
