class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :pseudonym
      t.string :email

      t.timestamps
    end
  end
end
