class RemovePseudonymFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :pseudonym, :string
    remove_column :words, :email, :string
  end
end
