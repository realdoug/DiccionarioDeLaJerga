require 'test_helper'

class WordTest < ActiveSupport::TestCase
   test "has many upvotes" do
     w = Word.create :name => "cabron"
     w.up_vote 'anysessionid'
     assert w.save
     assert_equal 1, w.up_votes.size
   end
end
