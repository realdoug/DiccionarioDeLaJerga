class Word < ActiveRecord::Base
  has_many :votes
  belongs_to :creator

  validates :name, :definition, :example, :creator_id, :presence => true

  accepts_nested_attributes_for :creator

  def to_param
    name.parameterize
  end

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
