class Creator < ActiveRecord::Base
	validates :pseudonym, :email, :presence => true
	validates :pseudonym, :uniqueness => true
	
	has_many :words

end
