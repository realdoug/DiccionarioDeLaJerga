class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voter_id
      t.integer :word_id
      t.boolean :upvote, default: true

      t.timestamps
    end
  end
end
