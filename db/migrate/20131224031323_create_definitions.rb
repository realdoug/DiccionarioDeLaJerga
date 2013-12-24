class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.text :body
      t.text :example
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end
  end
end
