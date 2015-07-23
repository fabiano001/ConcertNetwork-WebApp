class Concert < ActiveRecord::Base

	validates(:artist, {presence: true, length: {maximum: 80}})
	validates(:venue, {presence: true, length: {maximum: 80}})
	validates(:description, {presence: true})
	validates(:date, {presence: true})
	validates(:city, {presence: true, length: {maximum: 30}})
	validates(:price, {presence: true, numericality: true, format: {:with => /\A\d+(?:\.\d{0,2})?\z/}})
	validates(:poster, {presence: true})
	validates(:featured, {presence: true})

end