class RemoveDefinitionFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :definition
    remove_column :words, :name
    remove_column :words, :example
    remove_column :words, :pseudonym
    remove_column :words, :email
  end
end
