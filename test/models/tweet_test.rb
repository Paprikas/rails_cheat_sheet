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
