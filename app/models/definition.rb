class Definition < ActiveRecord::Base
	belongs_to :word
	belongs_to :country
	validates :country, presence: true
end
