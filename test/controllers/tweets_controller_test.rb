require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  cover TweetsController

  setup do
    @tweet = tweets(:one)
  end

  test "should get index" do
    get tweets_url
    assert_response :success
  end

  test "should create tweet" do
    assert_difference("Tweet.count") do
      post tweets_url, params: {tweet: {body: @tweet.body}}
    end

    assert_equal("Tweet was successfully created.", flash[:notice])
    assert_redirected_to tweets_url
  end

  test "should respond with empty form" do
    post tweets_url, params: {tweet: {body: @tweet.body}}, as: :turbo_stream
    assert_response :success
  end

  test "should not create tweet" do
    assert_no_difference("Tweet.count") do
      post tweets_url, params: {tweet: {body: ""}}
    end

    assert_response :unprocessable_entity
  end

  test "should respond with error form" do
    post tweets_url, params: {tweet: {body: ""}}, as: :turbo_stream
    assert_response :success
  end

  test "should show tweet" do
    get tweet_url(@tweet)
    assert_response :success
  end

  test "should get edit" do
    get edit_tweet_url(@tweet)
    assert_response :success
  end

  test "should update tweet" do
    patch tweet_url(@tweet), params: {tweet: {body: @tweet.body}}
    assert_redirected_to tweets_url
  end

  test "should destroy tweet" do
    assert_difference("Tweet.count", -1) do
      delete tweet_url(@tweet)
    end

    assert_equal("Tweet was successfully destroyed.", flash[:notice])
    assert_redirected_to tweets_url
  end
end
