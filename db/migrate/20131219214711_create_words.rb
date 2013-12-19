class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :definition
      t.string :name
      t.text :example
      t.string :pseudonym
      t.string :email

      t.timestamps
    end
  end
end
