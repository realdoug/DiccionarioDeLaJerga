class Country < ActiveRecord::Base
	has_many :definitions, through: :words
end