class CreatorsController < ApplicationController
	validates :pseudonym, uniqueness: true
end