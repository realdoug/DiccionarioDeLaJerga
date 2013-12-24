class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :pseudonym
      t.text :email
    end
  end
end
