# == Schema Information
#
# Table name: tweets
#
#  id          :bigint           not null, primary key
#  body        :text
#  likes_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class TweetTest < ActiveSupport::TestCase
  cover Tweet

  setup do
    @tweet = Tweet.new
  end

  test "valid if body is not empty" do
    @tweet.body = "1"

    assert(@tweet.valid?)
  end

  test "invalid if body is blank" do
    refute(@tweet.valid?)
  end

  test "invalid if body is too big" do
    @tweet.body = "a" * 101

    refute(@tweet.valid?)
  end
end
