class AddActiveToWords < ActiveRecord::Migration
  def change
    add_column :words, :active, :boolean, default: false
  end
end
