class Vote < ActiveRecord::Base
  belongs_to :word
  validates_uniqueness_of :voter_id

  scope :up, -> { where(upvote: true) }
  scope :down, -> { where(upvote: false) }
  scope :voter, ->(voter_id) { where(voter_id: voter_id) }
  def upvote?
    self.upvote
  end

  def downvote?
    !self.upvote
  end
end
