class Word < ActiveRecord::Base
  has_many :votes

  def up_votes
    votes.up
  end

  def down_votes
    votes.down
  end

  def up_vote(voter_id)
    votes.build voter_id: voter_id, upvote: true
  end

  def down_vote(voter_id)
    votes.build voter_id: voter_id, upvote: false
  end
end
