class CountriesDefinitions < ActiveRecord::Migration
  def change
  	create_table :countries_definitions, :id => false do |t|
      t.references :country
      t.references :definition
  	end
  end
end
